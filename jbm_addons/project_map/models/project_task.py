import logging
from odoo import models, fields, api
from shapely.geometry import Point
from shapely.wkt import dumps
from geopy.geocoders import ArcGIS
from pyproj import Transformer
import json

_logger = logging.getLogger(__name__)
geolocator = ArcGIS()

# Create a transformer object for converting from EPSG:4326 to EPSG:3857
transformer = Transformer.from_crs("EPSG:4326", "EPSG:3857", always_xy=True)

def convert_to_3857(lat, lon):
    x, y = transformer.transform(lon, lat)
    return x, y

class ProjectTask(models.Model):
    _inherit = 'project.task'
    
    partner_latitude = fields.Float(string="Latitude", digits=(16, 5))
    partner_longitude = fields.Float(string="Longitude", digits=(16, 5))
    partner_id = fields.Many2one("res.partner", string="Partner")
    task_address = fields.Char(string="Task Address")
    # project_id = fields.Many2one("project.project", string="Project", required=True, store=False)
    project_name = fields.Char(string="Project Name", compute="_compute_project_name", store=False)

    @api.depends("project_id")
    def _compute_project_name(self):
        for task in self:
            _logger.info(f"Computing project name for task {task.id}, project_id: {task.project_id}, project_name: {task.project_id.name}")
            if task.project_id and task.project_id.name:
                # Extract name assuming 'en_US' is the default key
                try:
                    project_name_json = json.loads(task.project_id.name) if isinstance(task.project_id.name, str) else task.project_id.name
                    task.project_name = project_name_json.get("en_US", task.project_id.name)
                except Exception as e:
                    task.project_name = task.project_id.name
            else:
                task.project_name = "No Project"
            
    geo_point = fields.GeoPoint(
        string="Location",
        compute="_compute_geo_point",
        store=True
    )
    
    @api.depends("partner_latitude", "partner_longitude")
    def _compute_geo_point(self):
        for task in self:
            _logger.info(f"Computing geo_point for task {task.id}")
            if task.partner_latitude and task.partner_longitude:
                point = Point(task.partner_longitude, task.partner_latitude)  # Note: longitude first, then latitude
                task.geo_point = point.wkt
                _logger.info(f"Computed geo_point for task {task.id}: {task.geo_point}")
            else:
                task.geo_point = False
                _logger.info(f"No valid coordinates for task {task.id}, setting geo_point to False")
                              
    @api.onchange('task_address')
    def _onchange_geocode_address(self):
        """ Automatically geocode address when changed """
        if self.task_address:
            self.geocode_address()

    def geocode_address(self):
        coords = geolocator.geocode(self.task_address)
        if coords:
            self.partner_latitude = coords.latitude
            self.partner_longitude = coords.longitude
            _logger.info(f"Geocoded address: {self.task_address} to lat: {self.partner_latitude}, lon: {self.partner_longitude}")

            # Convert coordinates to EPSG:3857
            x, y = convert_to_3857(self.partner_latitude, self.partner_longitude)
            _logger.info(f"Converted coordinates to EPSG:3857: x: {x}, y: {y}")

            # Update geo_point with the converted coordinates
            point = Point(x, y)
            self.geo_point = point.wkt
            _logger.info(f"Computed geo_point for task {self.id}: {self.geo_point}")
        else:
            _logger.error(f"Failed to geocode address: {self.task_address}")
            self.geo_point = False

    def read(self, fields=None, load='_classic_read'):
        """ Override the read method to add logging """
        records = super(ProjectTask, self).read(fields, load)
        for record in records:
            _logger.info(f"Read task {record['id']}: {record}")
        return records
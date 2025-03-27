# -*- coding: utf-8 -*-
{
    'name': 'Project Task Map',
    'version': '1.0',
    'summary': 'Adds a map view for project tasks',
    'category': 'Project Management',
    'author': 'Your Name',
    'website': 'https://yourwebsite.com',
    'depends': [
        'base',
        'project',
        'web',
        'base_geolocalize',
        'base_geoengine',
        'website_geoengine',
        'website',
        # 'partner_geolocalize',
        # 'project_geolocalize',
        # 'project_task_geolocalize',
        # 'partner_store',
    ], # Ensure geospatial dependencies
    'data': [
        'views/project_task_map_view.xml',
    ],
    'installable': True,
    'application': True,
}
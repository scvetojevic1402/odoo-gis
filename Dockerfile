FROM odoo:16

USER root
RUN apt-get update && apt-get install -y git python3-geojson python3-requests python3-shapely python3-simplejson python3-psycopg2
RUN pip install geopy requests shapely pyproj

USER odoo
# RUN git clone --branch 16.0 https://github.com/OCA/geospatial.git /mnt/extra-addons/geospatial
# RUN git clone --branch 16.0 https://github.com/OCA/timesheet.git /mnt/extra-addons/timesheet
# RUN git clone --branch 16.0 https://github.com/OCA/field-service.git /mnt/extra-addons/field-service
# RUN git clone --branch 16.0 https://github.com/avanzosc/odoo-addons.git /mnt/extra-addons/avanzosc
# RUN git clone --branch 16.0 https://github.com/OCA/web.git /mnt/extra-addons/web
# RUN git clone --branch 16.0 https://github.com/OCA/partner-contact.git /mnt/extra-addons/partner-contact


EXPOSE 8069
CMD ["odoo"]
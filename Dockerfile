FROM odoo:16

USER root
RUN apt-get update && apt-get install -y git python3-geojson python3-requests python3-shapely python3-simplejson python3-psycopg2
RUN git clone --branch 16.0 https://github.com/OCA/geospatial.git /mnt/extra-addons/geospatial

EXPOSE 8069
CMD ["odoo"]
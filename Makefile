.PHONY: clone-addons
clone-addons:
	mkdir -p extra-addons
	cd extra-addons && \
	[ -d geospatial ] || git clone --branch 16.0 https://github.com/OCA/geospatial.git && \
	[ -d timesheet ] || git clone --branch 16.0 https://github.com/OCA/timesheet.git && \
	[ -d field-service ] || git clone --branch 16.0 https://github.com/OCA/field-service.git && \
	[ -d avanzosc ] || git clone --branch 16.0 https://github.com/avanzosc/odoo-addons.git && \
	[ -d web ] || git clone --branch 16.0 https://github.com/OCA/web.git && \
	[ -d partner-contact ] || git clone --branch 16.0 https://github.com/OCA/partner-contact.git


.PHONY: run
run:
	@echo "Running the program..."
	make stop
	PYTHONPATH=$(pwd) docker-compose build --no-cache
	PYTHONPATH=$(pwd) docker-compose up
	@echo "Waiting for Odoo to be ready..."
	@until docker compose exec odoo_web curl -s http://localhost:8069/web/database/selector | grep -q "Odoo"; do sleep 5; done
	@echo "Updating Odoo module..."
	docker compose run --rm odoo_web odoo -c /etc/odoo/odoo.conf -u project_map

.PHONY: reinstall
reinstall:
	@echo "Reinstalling the program..."
	docker compose restart odoo_web
	# @echo "Waiting for Odoo to be ready..."
	# @until docker compose exec odoo_web curl -s http://localhost:8069/web/database/selector | grep -q "Odoo"; do sleep 5; done
	@echo "Reinstalling Odoo module..."
	docker compose exec odoo_web odoo -c /etc/odoo/odoo.conf --stop-after-init -u project_map

.PHONY: stop
stop:
	@echo "Stopping the program..."
	docker-compose down
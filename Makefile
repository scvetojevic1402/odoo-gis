.PHONY: run
run:
	@echo "Running the program..."
	make stop
	PYTHONPATH=$(pwd) docker-compose up --build

.PHONY: stop
stop:
	@echo "Stopping the program..."
	docker-compose down
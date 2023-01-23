ARTEMIS_VERSION := /Users/subhidh/Documents/apache-artemis-2.27.1/bin/artemis
create_broker:
	@$(ARTEMIS_VERSION) create \
	--user admin \
	--password admin \
	--allow-anonymous False \
	$(broker_path)/$(broker_name)

start_broker:
	@$(broker_path)/bin/artemis-service start

end_broker:
	@$(broker_path)/bin/artemis-service stop

restart_broker:
	@$(broker_path)/bin/artemis-service restart

deploy_broker:
	@echo "deploy"

start_all:
	@echo "start_all"

stop_all:
	@echo "stop_all"


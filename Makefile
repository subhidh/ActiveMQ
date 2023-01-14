ARTEMIS_VERSION := /Users/subhidh/Documents/apache-artemis-2.27.1/bin/artemis
create_broker:
	@$(ARTEMIS_VERSION) create \
	--home {ARTEMIS_VERSION} \
	--user admin \
	--password admin \
	--allow-anonymous False \
	$(broker_path)/$(broker_name)

start_broker:
	@echo "\nstart"
	@echo $(broker_path)/$(broker_name)/artemis


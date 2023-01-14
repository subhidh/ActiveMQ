ARTEMIS_VERSION := /Users/subhidh/Documents/apache-artemis-2.26.0/bin/artemis
create_broker:
	@$ARTEMIS_VERSION) create \
	--home {ARTEMIS_VERSION} \
	--user admin \
	--password admin \
	--allow-anonymous False \
	broker_name_github

start_broker:
	@echo "\nstart"
	@echo date


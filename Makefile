ARTEMIS_VERSION := /Users/subhidh/Documents/apache-artemis-2.26.0/bin/artemis
create_broker:
	@${ARTEMIS_VERSION} create \
	--user admin \
	--password admin \
	--allow-anonymous False \
	$(broker_path)/$(broker_name)

deploy_broker:
	@echo "deploy"
# change broker name
	@xmlstarlet ed -L \
    -N activemq="urn:activemq" \
    -N core="urn:activemq:core" \
    -u "/activemq:configuration/core:core/core:name" \
    -v "$(hostname)" \
		$(broker_path)/$(broker_name)/etc/broker.xml
# remove address xml
	@xmlstarlet ed -L \
    -N activemq="urn:activemq" \
    -N core="urn:activemq:core" \
    -d "/activemq:configuration/core:core/core:addresses" \
		$(broker_path)/$(broker_name)/etc/broker.xml
# add address xml include line
	@xmlstarlet ed -L \
    -N activemq="urn:activemq" \
    -N core="urn:activemq:core" \
    -s "/activemq:configuration/core:core" --type elem --name xi:include —attr --name href --value bin \
		$(broker_path)/$(broker_name)/etc/broker.xml
	
	@xmlstarlet ed -L \
    -N activemq="urn:activemq" \
    -N core="urn:activemq:core" \
		-i "/activemq:configuration/core:core/xi:include[not(@href)]" --type attr -n href --value $address_path \
		$(broker_path)/$(broker_name)/etc/broker.xml

# make a address.xml
	cp $(addresses.xml) $(broker_path)/$(broker_name)/etc/

start_broker:
	@$(broker_path)/$(broker_name)/bin/artemis-service start

stop_broker:
	@$(broker_path)/$(broker_name)/bin/artemis-service stop

restart_broker:
	@$(broker_path)/$(broker_name)/bin/artemis-service restart

start_all:
	@echo "start_all"

stop_all:
	@echo "stop_all"


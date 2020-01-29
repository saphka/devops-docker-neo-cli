FROM maven:3.5-jdk-8-alpine

RUN  apk add --no-cache bash libuuid && \
     mvn com.sap.cloud:neo-java-web-maven-plugin:3.97.8:install-sdk -DsdkInstallPath=sdk && \
     mvn com.sap.cloud:neo-java-web-maven-plugin:3.97.8:install-local -DsdkInstallPath=sdk && \
     ln -s /sdk/tools/neo.sh /usr/bin/neo.sh && \
     rm -rf /var/lib/apt/lists/*
RUN  mkdir -p /sdk/server/config_master/com.sap.security.um.provider.neo.local
RUN  echo '{"Users":[{"UID":"int-test","Password":"{SSHA}OPFlBj4ic6G5LCMyE8v5dLoeGp8bD5K3","Roles":["LoyaltyUser"],"Attributes":[{"attributeName":"firstname","attributeValue":"Integration"},{"attributeName":"lastname","attributeValue":"Test"},{"attributeName":"email","attributeValue":"int.test@masterdata.ru"}]}]}' > /sdk/server/config_master/com.sap.security.um.provider.neo.local/neousers.json
RUN chmod -R 777 sdk

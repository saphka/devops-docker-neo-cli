FROM maven:3.5-jdk-8-alpine

RUN  apk add --no-cache bash && \
     mvn com.sap.cloud:neo-java-web-maven-plugin:3.96.20:install-sdk -DsdkInstallPath=sdk && \
     mvn com.sap.cloud:neo-java-web-maven-plugin:3.96.20:install-local -DsdkInstallPath=sdk && \
     chmod -R 777 sdk && \
     ln -s /sdk/tools/neo.sh /usr/bin/neo.sh && \
     rm -rf /var/lib/apt/lists/*
RUN  echo '{"Users":[{"UID":"int-test","Password":"{SSHA}YkHqSKxgRoM6wn0XzdOxFmRSgvvB1lUw","Roles":["Administrator"],"Attributes":[{"attributeName":"firstname","attributeValue":"Integration"},{"attributeName":"lastname","attributeValue":"Test"},{"attributeName":"email","attributeValue":"int.test@masterdata.ru"}]}]}' > '/sdk/server/config_master/com.sap.security.um.provider.neo.local/neousers.json'  

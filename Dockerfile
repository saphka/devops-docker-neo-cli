FROM maven:3.5-jdk-8-alpine

RUN  apk add --no-cache bash && \
     mvn com.sap.cloud:neo-java-web-maven-plugin:3.96.20:install-sdk -DsdkInstallPath=sdk && \
     mvn com.sap.cloud:neo-java-web-maven-plugin:3.96.20:install-local -DsdkInstallPath=sdk && \
     chmod -R 777 sdk && \
     ln -s /sdk/tools/neo.sh /usr/bin/neo.sh && \
     rm -rf /var/lib/apt/lists/*
RUN  ls /sdk      

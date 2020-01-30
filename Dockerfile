FROM maven:3.6-jdk-8

RUN   apt-get update 
RUN   apt-get install bash
RUN   mvn com.sap.cloud:neo-java-web-maven-plugin:3.96.20:install-sdk -DsdkInstallPath=sdk
RUN   mvn com.sap.cloud:neo-java-web-maven-plugin:3.96.20:install-local -DsdkInstallPath=sdk
RUN   ln -s /sdk/tools/neo.sh /usr/bin/neo.sh
RUN   rm -rf /var/lib/apt/lists/*
RUN   chmod -R 777 sdk

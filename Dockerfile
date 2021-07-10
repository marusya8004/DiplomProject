FROM selenium/standalone-chrome

COPY pom.xml .
COPY src/ src/

USER root
RUN apt update && apt install -y maven openjdk-11-jdk
RUN mvn clean test -Dsurefire.suiteXmlFiles=src/test/resources/TestNG.xml

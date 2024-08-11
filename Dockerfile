#Base Image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get -y update && apt-get -y install openjdk-21-jdk wget
 
# Download and extract Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.28/bin/apache-tomcat-10.1.28.tar.gz -O /tmp/tomcat.tar.gz 
RUN cd /tmp && tar xvfz tomcat.tar.gz 
RUN mv /tmp/apache-tomcat-10.1.28 /opt/tomcat

# Copy the WAR file to the Tomcat webapp directory
COPY target/ABCtechnologies-1.0.war  /opt/tomcat/webapps/

# Expose the port Tomcat runs on
EXPOSE 8090

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

FROM tomcat:9.0.82-jdk-coretto
COPY target/mavenwebapp.war /usr/local/tomcat/webapps/mavenwebapp.war
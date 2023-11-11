FROM tomcat:8.0-alpine
ADD target/mavenwebapp.war /usr/local/tomcat/webapps/mavenwebapp.war
EXPOSE 8080
CMD["catalina.sh", "run"]
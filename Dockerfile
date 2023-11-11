FROM tomcat:9.0.82-jdk-coretto
COPY target/MavenWebApp.war /usr/local/tomcat/webapps/MavenWebApp.war
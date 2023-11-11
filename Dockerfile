FROM openjdk:17
EXPOSE 9090
COPY target/dg-devops-lab03.jar dg-devops-lab03.jar
ENTRYPOINT ["java", "-jar", "/dg-devops-lab03.jar"]
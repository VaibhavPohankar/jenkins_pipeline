FROM eclipse-temurin:11-jre-alpine

WORKDIR /app

COPY target/*.jar vibh_docker_app.jar

EXPOSE 9090

ENTRYPOINT ["java","-XX:+UseContainerSupport","-jar","vibh_docker_app.jar"]

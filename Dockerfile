FROM ubuntu:22.04

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-11-jre && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy JAR from Jenkins workspace
COPY target/vaibhav-jenkins-pipeline.jar vibh-app.jar

# Run app
CMD ["java", "-jar", "vibh-app.jar"]


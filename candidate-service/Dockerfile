#FROM openjdk:17-jdk-slim

#COPY /target/candidate-service-0.0.1-SNAPSHOT.jar /app/candidate-service-0.0.1-SNAPSHOT.jar

#WORKDIR /app

#EXPOSE 8080

#ENTRYPOINT ["java", "-jar", "candidate-service-0.0.1-SNAPSHOT.jar"]

# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app

# Copy only necessary files for dependency resolution
COPY pom.xml /app
RUN mvn dependency:go-offline -B

# Copy source code and build the application
COPY src /app/src
RUN mvn clean package -DskipTests

# Remove unnecessary files from Maven cache
RUN rm -rf /root/.m2/repository && rm -rf /root/.m2/wrapper

# Stage 2: Slim runtime environment
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Security: Use non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copy only the built JAR file from the build stage
COPY --from=build /app/target/candidate-service-0.0.1-SNAPSHOT.jar /app/candidate-service-0.0.1-SNAPSHOT.jar

# Expose the application port
EXPOSE 8080

# Entry point for the application
ENTRYPOINT ["java", "-jar", "candidate-service-0.0.1-SNAPSHOT.jar"]

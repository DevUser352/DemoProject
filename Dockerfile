FROM eclipse-temurin:21

# Working directory
WORKDIR /app

# Copy our java code
COPY . .

CMD ["java", "-jar", "target/DemoProject-1.0-SNAPSHOT.jar"]

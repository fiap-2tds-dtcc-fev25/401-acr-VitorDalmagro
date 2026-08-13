FROM eclipse-temurin:21 AS build

WORKDIR /app

COPY . .

RUN ./gradlew clean bootJar --no-daemon

# Imagem de execução
FROM gcr.io/distroless/java21:nonroot

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT [ "java" , "-jar", "app.jar" ]

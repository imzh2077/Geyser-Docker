FROM eclipse-temurin:21-jre-alpine

RUN addgroup -g 1000 geyser && \
    adduser -u 1000 -G geyser -s /bin/false -D geyser && \
    mkdir -p /app && chown geyser:geyser /app

USER geyser
WORKDIR /app

RUN wget -O Geyser-Standalone.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "Geyser-Standalone.jar"]

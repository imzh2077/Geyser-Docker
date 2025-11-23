FROM eclipse-temurin:21-jre-alpine

RUN addgroup -g 1000 appuser && \
    adduser -u 1000 -G appuser -s /bin/false -D appuser && \
    mkdir -p /app && chown appuser:appuser /app

USER appuser
WORKDIR /app

RUN wget -O Geyser-Standalone.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

CMD ["java", "-Xms768M", "-Xmx768M", "-jar", "Geyser-Standalone.jar"]

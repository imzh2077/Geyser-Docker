# 使用基于Alpine的Eclipse Temurin JDK 21镜像
FROM eclipse-temurin:21-jre-alpine

# 安装必要的软件包（例如wget）
RUN apk update && \
    apk add --no-cache wget

# 创建非root用户和组（UID和GID设为1000）
RUN addgroup -g 1000 appuser && \
    adduser -u 1000 -G appuser -s /bin/false -D appuser

# 创建应用程序目录并设置所有权
RUN mkdir -p /app && chown appuser:appuser /app

# 切换到非root用户
USER appuser

# 设置工作目录
WORKDIR /app

# 下载Geyser Standalone Jar
RUN wget -O Geyser-Standalone.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

# 设置容器启动命令
CMD ["java", "-Xms1024M", "-jar", "Geyser-Standalone.jar"]

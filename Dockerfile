# 使用 Debian 13 (Trixie) Slim 作为基础镜像
FROM debian:trixie-slim

# 安装 OpenJDK 21 和 wget
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-21-jdk-headless \
    wget && \
    # 清理缓存以减小镜像体积
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 创建名为 'appuser' 的非 root 用户，并指定 UID 和 GID 为 1000
RUN groupadd -g 1000 appuser && \
    useradd -m -u 1000 -g 1000 -s /bin/bash appuser

# 创建应用程序目录并设置所有权
RUN mkdir -p /app && chown appuser:appuser /app

# 切换到非 root 用户
USER appuser

# 设置工作目录
WORKDIR /app

# 下载 Geyser Standalone Jar
RUN wget -O Geyser-Standalone.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

# 设置容器启动命令
CMD ["java", "-Xms1024M", "-jar", "Geyser-Standalone.jar"]

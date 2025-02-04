FROM debian:bullseye-slim

# 更新 APT 并安装必要的软件
RUN apt update && apt install -y --no-install-recommends \
    locales \
    p7zip-full \
    ffmpeg=7:4.3.8-0+deb11u1 && \
    rm -rf /var/lib/apt/lists/*
# 更新 cert
RUN apt-get update && apt-get install -y ca-certificates bash wget openssl && update-ca-certificates && rm -rf /var/lib/apt/lists/*

# 配置中文支持
RUN sed -i 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen zh_CN.UTF-8 && \
    echo "LC_ALL=zh_CN.UTF-8" > /etc/default/locale && \
    echo "LANG=zh_CN.UTF-8" >> /etc/environment && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 确保 /tmp 目录权限
# RUN chmod -R 777 /tmp

# 显示可用语言
RUN locale -a

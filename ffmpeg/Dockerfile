FROM debian:bullseye-slim

# 更新 APT 并安装必要的软件
RUN apt update && apt install -y --no-install-recommends \
    locales \
    p7zip-full \
    ca-certificates \
    openssl \
    ffmpeg=7:4.3.8-0+deb11u2 && \
    rm -rf /var/lib/apt/lists/* &&  update-ca-certificates

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

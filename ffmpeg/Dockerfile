FROM debian:bullseye-slim

RUN apt update && apt install -y \
    locales \
    p7zip-full \
    ffmpeg=4.3.8-0 \
    musl


# 配置中文支持
RUN sed -i 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen
RUN locale-gen zh_CN.UTF-8
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "LC_ALL=zh_CN.UTF-8" >> /etc/environment
RUN echo "LANG=zh_CN.UTF-8" >> /etc/environment

# 确保 /tmp 目录权限
RUN chmod -R 777 /tmp

# 显示可用语言
RUN locale -a

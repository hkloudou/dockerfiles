# Start from a Python 3.8 slim image based on Debian Buster
FROM python:3.8-slim-buster

# RUN sed -i 's#http://deb.debian.org#http://mirrors.aliyun.com#g' /etc/apt/sources.list
# Install system dependencies (if any)
RUN apt-get update && apt-get install -y \
    curl xvfb scrot x11-utils \
    && rm -rf /var/lib/apt/lists/*
# RUN apt-get --allow-releaseinfo-change update && 
# Example: Install additional Python packages or scripts
# RUN pip install playwright

# RUN sed -i 's#http://deb.debian.org#http://mirrors.aliyun.com#g' /etc/apt/sources.list
# RUN apt-get --allow-releaseinfo-change update && apt install libgl1-mesa-glx libglib2.0-0 -y

ADD ./*.txt ./

WORKDIR /app

RUN cd /app \
    && python3 -m pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/\
    && pip3 install --no-cache-dir -r requirements.txt --extra-index-url https://mirrors.aliyun.com/pypi/simple/ \
    && rm -rf /tmp/* && rm -rf /root/.cache/*

# CMD ["python3", "ocr_server.py", "--port", "80", "--ocr", "--det"]

FROM python:3.8-slim-buster

WORKDIR /app

ADD ./*.txt ./*.py ./*.sh ./*.onnx ./

RUN sed -i 's#http://deb.debian.org#http://mirrors.aliyun.com/#g' /etc/apt/sources.list
RUN apt-get --allow-releaseinfo-change update && apt install libgl1-mesa-glx libglib2.0-0 -y

RUN cd /app \
    && python3 -m pip install --upgrade pip -i https://pypi.douban.com/simple/\
    && pip3 install --no-cache-dir -r requirements.txt --extra-index-url https://pypi.douban.com/simple/ \
    && rm -rf /tmp/* && rm -rf /root/.cache/*




CMD ["python3", "ocr_server.py", "--port", "9898", "--ocr", "--det"]
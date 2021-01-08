FROM python:3.6

WORKDIR /new_task

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY app.py .

COPY templates/index.html ./templates/

CMD ["python","app.py"]

FROM python:latest

WORKDIR /new_task

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY app.py .

COPY templates/index.html ./templates/

CMD ["python","app.py"]

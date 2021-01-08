FROM python:3.6

WORKDIR /new_task

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY app.py .

COPY templates/index.html ./templates/

CMD ["python","app.py"]

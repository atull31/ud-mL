FROM python:3.11-slim

WORKDIR /application

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update && \
    apt-get install -y awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . .

CMD ["python3", "app.py"]
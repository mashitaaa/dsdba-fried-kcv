FROM python:3.11-slim

RUN apt-get update && apt-get install -y git ffmpeg libsm6 libxext6 libgl1 cmake && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir gradio==4.44.1 uvicorn websockets

COPY . .

CMD ["python", "app.py"]

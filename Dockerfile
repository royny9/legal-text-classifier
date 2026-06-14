# 1. Базовый образ с Python
FROM python:3.10-slim


WORKDIR /app

# 3. Установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt


COPY llm.ipynb .
COPY internship_50k.parquet .
COPY models/ ./models/


EXPOSE 8889


CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

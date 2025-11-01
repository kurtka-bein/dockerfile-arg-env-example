# syntax=docker/dockerfile:1.6
FROM python:3.11-alpine

# Build-time аргумент
ARG TEST_ARG

RUN echo "TEST_ARG=${TEST_ARG}"

# Копируем приложение внутрь образа
WORKDIR /app
COPY app.py .

# Устанавливаем Flask
RUN pip install --no-cache-dir flask

EXPOSE 5000
CMD ["python", "app.py"]

# syntax=docker/dockerfile:1.6
FROM python:3.11-alpine

# Build-time аргумент
ARG TEST_ARG

# Устанавливаем Flask
RUN pip install --no-cache-dir flask

# Пишем простой Flask-приложение
RUN echo 'from flask import Flask, jsonify\n' \
         'import os\n' \
         'app = Flask(__name__)\n' \
         '@app.route("/")\n' \
         'def index():\n' \
         '    return jsonify(TEST_ENV=os.getenv("TEST_ENV"))\n' \
         'if __name__ == "__main__":\n' \
         '    app.run(host="0.0.0.0", port=5000)' > app.py

EXPOSE 5000

CMD ["python", "app.py"]

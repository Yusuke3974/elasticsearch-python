# Elasticsearch Dockerfile
FROM docker.elastic.co/elasticsearch/elasticsearch:8.1.0
RUN elasticsearch-plugin install analysis-kuromoji

# Python Dockerfile
FROM python:3.11
# ここに必要なPythonパッケージやアプリケーションのインストールを追加する

# 例えば、Pythonコンテナ内でElasticsearchと通信するためにelasticsearchパッケージを追加する場合
RUN pip install poetry
RUN poetry config virtualenvs.create false
COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root

# もしくは、必要なPythonアプリケーションをコピーする場合
COPY ./python /app

# デフォルトでPythonコンテナで起動するコマンドを指定する場合
# CMD ["python", "app.py"]

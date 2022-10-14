FROM python:3.10.7-slim
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get update \
  # dependencies for building Python packages:
  && apt-get install -y build-essential \
  #gramtool deps:
  && apt-get install -y libhunspell-dev \
  #extras:
  && apt-get install -y bash vim

RUN pip install poetry

WORKDIR /code

COPY pyproject.toml poetry.lock /code/
RUN poetry install --no-ansi --no-interaction

COPY . /code/

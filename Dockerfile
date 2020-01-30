FROM python:3.7-alpine
LABEL maintainer = "John Kussmann"

ENV PYTHONUNBUFFERED 1
ENV COMPOSE_CONVERT_WINDOWS_PATHS=1

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY app /app

# Create a user to run the application
RUN adduser -D user
USER user

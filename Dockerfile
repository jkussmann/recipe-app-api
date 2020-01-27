FROM python:3.7-alpine
LABEL maintainer = "John Kussmann"

ENV PYTHONUNBUFFERED 1

COPY dependencies/requirements.txt /requirements.txt

RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY app /app

# Create a user to run the application
RUN adduser -D user
USER user

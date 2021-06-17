FROM python:3.9-alpine
MAINTAINER Shehan Jayasinghe(Black JS)
ENV PYTHONUNBUFFERED 1

COPY ./requirement.txt /requirement.txt
RUN pip install --upgrade pip; \
    pip install -r requirement.txt


RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
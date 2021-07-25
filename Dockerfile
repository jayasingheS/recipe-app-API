FROM python:3.9-alpine
MAINTAINER Shehan Jayasinghe(Black JS)
ENV PYTHONUNBUFFERED 1

COPY ./requirement.txt /requirement.txt
RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
RUN pip install --upgrade pip; \
    pip install -r requirement.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
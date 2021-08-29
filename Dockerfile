#FROM ubuntu:20.04
FROM python:3.8-slim-buster
RUN apt-get update -y
RUN apt-get install -y default-libmysqlclient-dev python3-pip python3-dev build-essential 

LABEL maintainer="Amit Sharma <sharma.95@iitj.ac.in>"

EXPOSE 5000


# Install pip requirements
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

WORKDIR /app
COPY . /app

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
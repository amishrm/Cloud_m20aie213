FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y default-libmysqlclient-dev python3-pip python3-dev build-essential
LABEL maintainer="Amit Sharma <sharma.95@iitj.ac.in>"

EXPOSE 5000
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

COPY . /app
WORKDIR /app

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

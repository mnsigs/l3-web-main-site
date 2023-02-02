FROM python:3.10

WORKDIR /app

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --assume-yes python3-dev build-essential

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app .

EXPOSE 80

CMD gunicorn --bind :80 app:app

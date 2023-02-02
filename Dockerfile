FROM python:3.10

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --assume-yes python3-dev build-essential

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app .

EXPOSE 443

CMD gunicorn --bind :443 app:app

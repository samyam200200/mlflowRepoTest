FROM python:3.9

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

COPY ./main.py /app/main.py

RUN apt-get update && apt-get install -y --no-install-recommends supervisor gettext-base nginx apache2-utils

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./entry-point.sh /app/entry-point.sh

COPY ./webserver.sh /app/webserver.sh

COPY ./mlflow.sh /app/mlflow.sh

COPY ./fastapi.sh /app/fastapi.sh

COPY /nginx.conf /etc/nginx/nginx.conf

CMD ["/bin/bash", "/app/entry-point.sh"]

EXPOSE 80
#!/bin/bash -x

htpasswd -b -c /etc/nginx/.htpasswd mlflow mlflow

exec nginx -g "daemon off;"

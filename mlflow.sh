#!/bin/bash -x

exec mlflow ui --backend-store-uri sqlite:///mlflow.db --default-artifact-root ./artifacts
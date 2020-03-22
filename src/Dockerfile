FROM python:3.8-alpine

ARG MLFLOW_VERSION

ENV BACKEND_STORE_URI='/opt/store'
ENV DEFAULT_ARTIFACT_ROOT='/opt/artifact'
EXPOSE 5000

RUN addgroup -S mlflow && adduser -S mlflow -G mlflow
RUN apk add --no-cache mariadb-connector-c-dev libstdc++ ;\
    apk add --no-cache --virtual .build-deps \
        build-base \
        mariadb-dev ;\
#    pip3 install --upgrade pip && pip3 install mlflow==${MLFLOW_VERSION} mysqlclient==1.4.6;\
    apk del .build-deps
RUN mkdir -p $DEFAULT_ARTIFACT_ROOT $BACKEND_STORE_URI && chown mlflow:mlflow $DEFAULT_ARTIFACT_ROOT $BACKEND_STORE_URI
USER mlflow

CMD ["mlflow" , "server", "--backend-store-uri", "$BACKEND_STORE_URI", "--default-artifact-root", "$DEFAULT_ARTIFACT_ROOT", "--host", "0.0.0.0"]


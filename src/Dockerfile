FROM python:3.8-alpine

WORKDIR /opt
COPY requirements.txt /opt

ENV BACKEND_STORE_URI='/opt/store'
ENV DEFAULT_ARTIFACT_ROOT=/opt/artifact
RUN mkdir -p $DEFAULT_ARTIFACT_ROOT $BACKEND_STORE_URI
EXPOSE 80

RUN apk add --no-cache mariadb-connector-c-dev ;\
    apk add --no-cache --virtual .build-deps \
        build-base \
        mariadb-dev ;\
    pip3 install --upgrade pip && pip3 install -r /opt/requirements.txt;\
    apk del .build-deps

CMD ["mlflow" , "server", "--backend-store-uri", "$BACKEND_STORE_URI", "--default-artifact-root", "$DEFAULT_ARTIFACT_ROOT", "--host", "0.0.0.0"]


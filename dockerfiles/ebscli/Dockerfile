FROM node:14-alpine

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache \
        build-base \
        openssl \
        git \
        zip \
        python3 \
        python3-dev \
        libffi-dev \
        libressl-dev && \
    ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade \
        pip \
        setuptools \
        awscli \
        awsebcli && \
    mkdir -p /app

WORKDIR /app

ENTRYPOINT [ "eb" ]
CMD [ ]

FROM alpine:3.7

MAINTAINER Reto Hasler <reto.hasler@asciich.ch>

COPY ./files/* /

RUN apk upgrade --no-cache && \
    apk update && \
    apk add --no-cache \
        python3 \
        py3-pip \
    \
    && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade \
        tox \
    \
    && \
    rm -rf /var/cache/* && \
    rm -rf /root/.cache/pip/ \
    \
    && \
    for SCRIPT in $(ls /*.sh) ; do \
        chmod +x ${SCRIPT} ; \
        DEST=$(echo "/usr/bin/${SCRIPT}" | sed 's/\.sh//g') ; \
        mv -v ${SCRIPT} ${DEST} ; \
    done
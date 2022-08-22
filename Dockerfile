# SPDX-License-Identifier: MIT
# https://hub.docker.com/_/alpine
FROM docker.io/library/alpine:3.16.2

# https://github.com/adrienverge/yamllint/tags
ARG YAMLLINT_VERSION=1.26.3

ARG PYTHON3_VERSION=3.10.5-r0
ARG PY3_PIP_VERSION=22.1.1-r0

RUN set -eux; \
	apk add --no-cache python3=${PYTHON3_VERSION}; \
	apk add --no-cache --virtual .build-deps py3-pip=${PY3_PIP_VERSION}; \
	pip3 install --no-cache-dir --no-compile yamllint==${YAMLLINT_VERSION}; \
	apk del .build-deps; \
	find /usr/lib/ -type d -name '__pycache__' -exec rm -rf {} +

WORKDIR /workdir

ENTRYPOINT ["/usr/bin/yamllint"]
CMD ["--help"]

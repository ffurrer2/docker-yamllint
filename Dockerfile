# SPDX-License-Identifier: MIT
# docker.io/library/alpine:3.13.0
FROM alpine@sha256:d9a7354e3845ea8466bb00b22224d9116b183e594527fb5b6c3d30bc01a20378

ARG PYTHON3_VERSION=3.8.7-r0
ARG PY3_PIP_VERSION=20.3.3-r0
ARG YAMLLINT_VERSION=1.25.0

RUN set -eux; \
	apk add --no-cache python3=${PYTHON3_VERSION}; \
	apk add --no-cache --virtual .build-deps py3-pip=${PY3_PIP_VERSION}; \
	pip3 install --no-cache-dir --no-compile yamllint==${YAMLLINT_VERSION}; \
	apk del .build-deps; \
	find /usr/lib/ -type d -name '__pycache__' -exec rm -rf {} +

ARG BUILD_DATE
ARG BUILD_VERSION

LABEL org.opencontainers.image.authors="Felix Furrer" \
	org.opencontainers.image.created="${BUILD_DATE}" \
	org.opencontainers.image.description="A linter for YAML files." \
	org.opencontainers.image.documentation="https://github.com/ffurrer2/docker-yamllint/blob/main/README.md" \
	org.opencontainers.image.licenses="GPL-3.0-or-later" \
	org.opencontainers.image.source="https://github.com/ffurrer2/docker-yamllint.git" \
	org.opencontainers.image.title="yamllint" \
	org.opencontainers.image.url="https://github.com/ffurrer2/docker-yamllint" \
	org.opencontainers.image.vendor="Felix Furrer" \
	org.opencontainers.image.version="${BUILD_VERSION}"

WORKDIR /workdir

ENTRYPOINT ["/usr/bin/yamllint"]
CMD ["--help"]

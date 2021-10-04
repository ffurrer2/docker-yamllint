# SPDX-License-Identifier: MIT
# docker.io/library/alpine:3.14.2
FROM alpine@sha256:e1c082e3d3c45cccac829840a25941e679c25d438cc8412c2fa221cf1a824e6a

ARG PYTHON3_VERSION=3.9.5-r1
ARG PY3_PIP_VERSION=20.3.4-r1
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

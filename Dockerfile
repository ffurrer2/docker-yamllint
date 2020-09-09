# SPDX-License-Identifier: MIT
# docker.io/library/alpine:3.12.0
FROM alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321

ARG PYTHON3_VERSION=3.8.5-r0
ARG PY3_PIP_VERSION=20.1.1-r0
ARG YAMLLINT_VERSION=1.24.2

RUN set -eux; \
	apk add --no-cache python3=${PYTHON3_VERSION}; \
	apk add --no-cache --virtual .build-deps py3-pip=${PY3_PIP_VERSION}; \
	pip3 install --no-cache-dir --no-compile yamllint==${YAMLLINT_VERSION}; \
	apk del .build-deps; \
	find /usr/lib/ -type d -name '__pycache__' -exec rm -rf {} +

ARG BUILD_DATE

LABEL org.opencontainers.image.authors="Felix Furrer" \
	org.opencontainers.image.created="${BUILD_DATE}" \
	org.opencontainers.image.description="A linter for YAML files." \
	org.opencontainers.image.documentation="https://github.com/ffurrer2/docker-yamllint/blob/master/README.md" \
	org.opencontainers.image.licenses="GPL-3.0-or-later" \
	org.opencontainers.image.source="https://github.com/ffurrer2/docker-yamllint.git" \
	org.opencontainers.image.title="yamllint" \
	org.opencontainers.image.url="https://github.com/ffurrer2/docker-yamllint" \
	org.opencontainers.image.vendor="Felix Furrer" \
	org.opencontainers.image.version="${YAMLLINT_VERSION}"

WORKDIR /workdir

ENTRYPOINT ["/usr/bin/yamllint"]
CMD ["--help"]

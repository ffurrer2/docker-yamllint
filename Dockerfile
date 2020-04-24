# SPDX-License-Identifier: MIT
FROM alpine:latest

ARG YAMLLINT_VERSION=1.21.0

RUN set -eux; \
    apk add --no-cache python3; \
    pip3 install --no-cache-dir --no-compile yamllint==${YAMLLINT_VERSION}; \
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

ENTRYPOINT [ "/usr/bin/yamllint" ]
CMD [ "--help" ]

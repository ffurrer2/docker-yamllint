<!-- SPDX-License-Identifier: MIT -->
# yamllint Docker image

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/ffurrer/yamllint)](https://hub.docker.com/r/ffurrer/yamllint/builds)
[![Docker Cloud Automated Build](https://img.shields.io/docker/cloud/automated/ffurrer/yamllint)](https://hub.docker.com/r/ffurrer/yamllint/builds)
[![Docker Image Version](https://img.shields.io/docker/v/ffurrer/yamllint?sort=semver)](https://hub.docker.com/r/ffurrer/yamllint/tags)
[![Docker Image Size](https://img.shields.io/docker/image-size/ffurrer/yamllint/latest)](https://hub.docker.com/r/ffurrer/yamllint/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/ffurrer/yamllint)](https://hub.docker.com/r/ffurrer/yamllint)

This repository provides a lightweight alpine-based Docker image for [yamllint](https://github.com/adrienverge/yamllint).

## Supported tags and respective Dockerfile links

- [`1.25.0`, `1.25`, `latest`](https://github.com/ffurrer2/docker-yamllint/blob/master/Dockerfile)

## Usage

### Command line

To lint the yaml files in the current directory, run the following command:

```bash
docker run -it --rm -v "$(pwd):/workdir" ffurrer/yamllint:latest .
```

### GitHub Actions

To use `yamllint` within GitHub Actions, add the following job to your workflow file:

```yaml
yamllint:
  runs-on: ubuntu-latest
  steps:
  - name: Checkout
    uses: actions/checkout@v2
  - name: yamllint
    uses: docker://ffurrer/yamllint:latest
    with:
      args: '--format github .'
```

## Examples

### Lint a single yaml file

```bash
docker run -it --rm -v "$(pwd):/workdir" ffurrer/yamllint my-file.yaml
```

### Lint all yaml files in a subdirectory

```bash
docker run -it --rm -v "$(pwd):/workdir" ffurrer/yamllint ./subdir
```

### Use `yamllint` options

```bash
docker run -it --rm -v "$(pwd):/workdir" ffurrer/yamllint --strict --format parsable .
```

### Show help message

```bash
docker run -it --rm ffurrer/yamllint
```

### Show version

```bash
docker run -it --rm ffurrer/yamllint --version
```

## License

This project is licensed under the [MIT License](LICENSE).

View license information for [Python 3](https://docs.python.org/3/license.html) and [yamllint](https://github.com/adrienverge/yamllint/blob/master/LICENSE).

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

Some additional license information which was able to be auto-detected might be found in the [repo-info repository's alpine/ directory](https://github.com/docker-library/repo-info/tree/master/repos/alpine).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

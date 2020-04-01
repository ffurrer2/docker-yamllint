# yamllint Docker image

[![MIT License](https://img.shields.io/github/license/ffurrer2/docker-yamllint)](https://github.com/ffurrer2/docker-yamllint/blob/master/LICENSE)

This repository provides a lightweight alpine-based Docker image for [yamllint](https://github.com/adrienverge/yamllint).

## Supported tags and respective Dockerfile links

- [`1.21.0`, `1.21`, `latest`](https://github.com/ffurrer2/docker-yamllint/blob/master/Dockerfile)

## Usage

### Command line

To lint the yaml files in your current directory, run the following command:

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
      args: '.'
```

## Examples

### Lint a single yaml file

```bash
docker run -it --rm -v "$(pwd):/workdir" ffurrer/yamllint my-file.yaml
```

### Use `yamllint` with options

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

Some additional license information which was able to be auto-detected might be found in the [repo-info repository's python/ directory](https://github.com/docker-library/repo-info/tree/master/repos/python).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

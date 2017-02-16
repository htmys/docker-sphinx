# Docker image for Sphinx

## Build image

```bash
docker build -t htomiyoshi/sphinx .
```

or if you are in proxy environment:

```bash
docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} -t htomiyoshi/sphinx .
```


## Build Sphinx document

### Build HTML

```bash
cd /path/to/documents
docker run --rm -v "$(pwd):/docs" htomiyoshi/sphinx make html
```

### Build HTML using sphinx-autobuild

* Run sphinx-autobuild

```bash
docker run --rm -v "$(pwd):/docs" -p 8000:8000 htomiyoshi/sphinx sphinx-autobuild --host "0.0.0.0" /path/to/source /path/to/output
```

* Open URL with browser

```
http://localhost:8000
```

### Build PDF

```bash
cd /path/to/documents
docker run --rm -v "$(pwd):/docs" htomiyoshi/sphinx make latexpdf
```

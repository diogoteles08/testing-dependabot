# Dockerfile to test if Dependabot suggest version updates on dockerfile

# Not pinned container image
FROM ubuntu:18.04

# Hash Pinned
FROM ubuntu@sha256:ca5534a51dd04bbcebe9b23ba05f389466cf0c190f1f8f182d7eea92a9671d00

# Environment
ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-c"]   # Use Bash as shell


# Not pinned download using apt-get then run package
# Install all basic requirements
RUN \
    apt-get update && \
    apt-get install python3.1 && \
    python --version

# Install python requirement without hashing
RUN \
    pip install "pylint==1.0.0"

# Install all python hashed requirements
RUN \
    pip install --require-hashes -r requirements.txt


# Install npm requirement without hashing
RUN \
    apt-get install npm && \
    npm install diogo-testing-npm-provenance@1.0.0

# Install all npm hashed requirements
RUN \
    npm ci


RUN \
	apt-get install golang-go && \
	go get github.com/jung-kurt/gofpdf@v1.15.1


# Install package using chocolatey
RUN \
    apt-get update && \
    apt-get install choco && \
    choco install tidyjson.portable --version=1.0.1 --require-checksums && \
	choco install packages.config

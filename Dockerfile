# Dockerfile to test if Dependabot suggest version updates on dockerfile

# Not pinned container image
FROM ubuntu:22.04

# Hash Pinned
FROM ubuntu@sha256:1e0fc95b856ec6592c530b522fe0500af9bff5ed1f962216d3c45063bd26e09b

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

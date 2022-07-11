# Dockerfile with github (gh CLI)
FROM debian:stable-slim

RUN apt update \
    && apt install -y git curl wget \
    && git version \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ARG CLI_VERSION=2.13.0
RUN wget -O- https://github.com/cli/cli/releases/download/v${CLI_VERSION}/gh_${CLI_VERSION}_linux_amd64.tar.gz | tar zx --strip-components=1 \
    && rm -rf "gh_${CLI_VERSION}_linux_amd64.tar.gz" \
    # verify gh binary works
    && gh --version;

CMD ["gh"]
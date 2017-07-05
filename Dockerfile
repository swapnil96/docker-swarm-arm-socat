FROM       	resin/raspberrypi3-alpine
MAINTAINER 	Swapnil Das <dasswapnil96@gmail.com>

ARG "version=0.1.0-dev"
ARG "build_date=5/7/17"
ARG "commit_hash=unknown"
ARG "vcs_url=unknown"
ARG "vcs_branch=unknown"

LABEL org.label-schema.vendor="Personal" \
    org.label-schema.name="Socat" \
    org.label-schema.description="Exposes to a defined OUTPUT PORT the INPUT from a TCP endpoint." \
    org.label-schema.usage="/src/README.md" \
    org.label-schema.url="https://github.com/swapnil96/docker-swarm-arm-socat/blob/master/README.md" \
    org.label-schema.vcs-url=$vcs_url \
    org.label-schema.vcs-branch=$vcs_branch \
    org.label-schema.vcs-ref=$commit_hash \
    org.label-schema.version=$version \
    org.label-schema.schema-version="1.0" \
    org.label-schema.docker.cmd.devel="" \
    org.label-schema.docker.params="IN=Input,\
OUT=Output" \
    org.label-schema.build-date=$build_date

USER swapnil
ENV "IN=172.18.0.1:4999" \
    "OUT=4999" \
    "HOME=/home/swapnil"

RUN apk add --no-cache socat

ENTRYPOINT socat -d -d TCP-L:$OUT,fork TCP:$IN

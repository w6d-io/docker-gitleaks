FROM golang:1.15.5 AS build
ARG VCS_REF
ARG BUILD_DATE
ARG VERSION
ARG USER_EMAIL="david.alexandre@w6d.io"
ARG USER_NAME="David ALEXANDRE"
LABEL maintainer="${USER_NAME} <${USER_EMAIL}>" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/w6d-io/gitleaks" \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.version=$VERSION

ENV DESIRED_VERSION $DESIRED_VERSION

WORKDIR /go/src/github.com/zricethezav/gitleaks
ARG ldflags
COPY . .
RUN GO111MODULE=on CGO_ENABLED=0 go build -o bin/gitleaks -ldflags "-X="${ldflags} *.go

FROM alpine:3.11
RUN apk add --no-cache bash git openssh
RUN git clone https://github.com/zricethezav/gitleaks.git
COPY --from=build /go/src/github.com/zricethezav/gitleaks/bin/* /usr/bin/
ENTRYPOINT ["gitleaks"]

# How to use me :

# docker build -t gitleaks .
# docker run --rm --name=gitleaks gitleaks --repo-url=https://github.com/zricethezav/gitleaks

# This will check for secrets in https://github.com/zricethezav/gitleaks
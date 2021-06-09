FROM zricethezav/gitleaks:latest
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

FROM alpine:3.11
RUN apk add --no-cache bash git openssh
ENTRYPOINT ["gitleaks"]


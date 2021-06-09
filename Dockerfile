FROM golang:alpine as build

WORKDIR /build

RUN apk --no-cache add git

#RUN GO111MODULE=on go get github.com/zricethezav/gitleaks/v7i
RUN GO111MODULE=on go get github.com/zricethezav/gitleaks/releases/tag/v7.5.0

# ---

FROM opendevsecops/launcher:latest as launcher

# ---

FROM alpine:latest

WORKDIR /run

RUN apk --no-cache add \
		git \
		openssh

COPY configs configs

COPY --from=build /go/bin/gitleaks /bin/gitleaks

COPY --from=launcher /bin/launcher /bin/launcher

WORKDIR /session

ENTRYPOINT ["/bin/launcher", "/bin/gitleaks"]

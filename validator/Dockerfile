FROM golang:buster

# RUN apt update && apt install -y curl make git wget cmake gcc jq build-essential vim

RUN mkdir /root/.evmosd
WORKDIR /root/.evmosd

COPY ./config/ /root/config/
COPY ./evmosd /usr/local/bin/
COPY ./init.sh /root/.evmosd

#! /bin/sh

registry=ghcr.io
namespace=andreemeilio
imagename=karsajobs

docker build -t ${registry}/${namespace}/${imagename}:latest .
echo $CR_PAT | docker login ${registry} -u USERNAME --password-stdin
docker push ${registry}/${namespace}/${imagename}:latest

#!/bin/bash

# variable untuk kebutuhan pushing image ke ghcr
githubUsername=AndreeMeilio
namespace=andreemeilio
imagename=item-app
version=v1

#  build image dari Dockerfile dengan nama item-app version v1
docker build -t $imagename:$version .

# Melihat daftar image yang terdapat pada sistem
docker images

# Mengubah nama image agar sesuai dengan GHCR
docker image tag $imagename:$version ghcr.io/$namespace/$imagename:$version

# Login ke dalam GHCR dengan menggunakan username dan personal token access
# variable $CR_PATH disimpan dengan menggunakan export, bisa dengan cara menambahkan code pada ~/.bashrc
#export=YOUR_TOKEN
# cara ini direkomendasikan langsung oleh github untuk login ke ghcr. berikut link dokumentasinya https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry

echo $CR_PATH | docker login ghcr.io --username $githubUsername --password-stdin

# Pushing image ke ghcr
docker push ghcr.io/$namespace/$imagename:$version

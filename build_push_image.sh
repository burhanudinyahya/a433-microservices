#! /bin/bash

printf '\n'
# membuat Docker image dari Dockerfile yang tadi dibuat, dengan nama image item-app, dan memiliki tag v1.
echo '1. build item-app:v1 image dari Dockerfile'
docker build -t item-app:v1 .
printf '\n'

# melihat daftar image di lokal.
echo '2. melihat daftar image di lokal'
docker images
printf '\n'

# mengubah nama image agar sesuai dengan format GitHub Packages
echo '3. mengubah nama image agar sesuai dengan format GitHub Packages'
docker tag item-app:v1 ghcr.io/burhanudinyahya/item-app:v1
echo 'Berhasil'
printf '\n'

# login ke GitHub Packages
# 1. get YOUR_TOKEN by Generete new token (clasic) via https://github.com/settings/tokens
# 2. make sure check read:packages, write:packages and delete:packages
# 3. run `export CR_PAT=YOUR_TOKEN` in your terminal
# 4. run this script `./build_push_image.sh`
echo '4. login ke GitHub Packages'
echo $CR_PAT | docker login ghcr.io -u burhanudinyahya --password-stdin
printf '\n'

# mengunggah image ke GitHub Packages
echo '5. mengunggah image ke GitHub Packages'
docker push ghcr.io/burhanudinyahya/item-app:v1
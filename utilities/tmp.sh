#!/bin/bash

pushd /home/tjs/sigma-chi/l3-web-main-site

podman container stop testapp && podman container rm testapp

podman build -t testapp:tmptesting .

podman create --pod mypod --name testapp testapp:tmptesting &&  podman pod start mypod

popd

#!/bin/bash

set -e

mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global color.ui true

cd /build

repo init -u https://github.com/flashbots/yocto-manifests.git -b tdx
repo sync
source setup

cp rbuilder /build/srcs/poky/meta-evm/recipes-nodes/rbuilder
cp lighthouse /build/srcs/poky/meta-evm/recipes-nodes/lighthouse

make build
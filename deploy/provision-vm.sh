#!/usr/bin/env bash

apt-get update
apt-get install -y build-essential git-core libssl-dev libfontconfig1-dev gdb binutils-gold

if [[ ! -d phantomjs ]]; then
    git clone git://github.com/ariya/phantomjs.git
fi

cd phantomjs
git fetch origin
git checkout $1

cp /vagrant/build-and-package.sh deploy/
cp /vagrant/package-linux-dynamic.sh deploy/

deploy/build-and-package.sh

cp deploy/*.tar.bz2 /vagrant

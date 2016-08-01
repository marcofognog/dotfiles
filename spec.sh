#! /bin/bash

set +xe

sudo apt-get install git -y
./containerizable.sh
./vim_spec.sh

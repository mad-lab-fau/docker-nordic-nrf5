#! /bin/bash

versions=("15.0.0_a53641a" "15.2.0_9412b96" "15.3.0_59ac345")

for version in "${versions[@]}"
do
    mkdir -p ./${version}
    sed "s/%%SDK_VERSION_TEMPLATE%%/${version}/g" ./Dockerfile.template > ./${version}/Dockerfile
done

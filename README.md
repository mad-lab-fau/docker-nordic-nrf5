# Nordic NRF5 SDK Docker Image

This repository provides base images for the nordic-nrf5-sdk, which can be used to complile microncontroller firmware requiring the SDK as dependencies.

## Available versions

This repo provides images for the following versions:

- 15.0.0
- 15.2.0
- 15.3.0

Note: the 15.0.0 version includes a required manual fix for a missing import [bug](https://devzone.nordicsemi.com/f/nordic-q-a/28964/missing-include-in-ble_radio_notification-c)

## How to support new versions

All Dockerfiles in the repo are generated based on the `Dockerfile.template` file using the `create_docker.sh` script.
To support a new version and create a new Dockerfile the latter needs to be modified.
To build the image automatically on [DockerHub](https://cloud.docker.com/u/madlabfau/repository/docker/madlabfau/nordic-nrf5-sdk/general) a new tag needs be created there manually pointing to the new file.

If an image is build locally, it is also possible to just overwrite the `SDK_VERSION` env-var via the build-context

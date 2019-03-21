FROM debian:9

ENV SDK_ROOT=/opt/nordic

RUN apt-get update \
    && apt-get install -y gcc-arm-none-eabi \
    && apt-get install -y build-essential \
    && apt-get install -y unzip \
    && apt-get install -y wget

RUN mkdir -p ${SDK_ROOT} \
    && wget https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.0.0_a53641a.zip -O nordic_sdk.zip \
    && unzip nordic_sdk.zip \
    && mv nRF5_SDK_*/* ${SDK_ROOT} \
    && rm -r ${SDK_ROOT}/examples \
    && rm -r nRF5_SDK_* \
    && rm nordic_sdk.zip \
    && sed -i "/GNU_INSTALL_ROOT ?=/c\GNU_INSTALL_ROOT ?= /usr/bin/" ${SDK_ROOT}/components/toolchain/gcc/Makefile.posix \
    && sed -i '1s/^/#include "nrf_nvic.h"\n/' ${SDK_ROOT}/components/ble/ble_radio_notification/ble_radio_notification.c

ENV NRF52_SDK_15_0_0_HOME=${SDK_ROOT}

COPY ./NRF5* /opt/project

RUN cd /opt/project/ && make DFU_BOOTLOADER_FIRMWARE_ENABLE="1"

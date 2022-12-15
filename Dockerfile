FROM ubuntu:22.04

ARG OPENCV_VERSION=4.x
ARG DEBIAN_FRONTEND=noninteractive

COPY . /usr/src/demoprg

WORKDIR /usr/src/demoprg/src/bin

RUN set -ex \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        build-essential cmake git \
        wget unzip \
        libhdf5-103-1 libhdf5-dev \
        libopenblas0 libopenblas-dev \
        libprotobuf23 libprotobuf-dev \
        libjpeg8 libjpeg8-dev \
        libpng16-16 libpng-dev \
        libtiff5 libtiff-dev \
        libwebp7 libwebp-dev \
        libopenjp2-7 libopenjp2-7-dev \
        libtbb2 libtbb2-dev \
        libeigen3-dev \
        tesseract-ocr tesseract-ocr-por libtesseract-dev \
        python3 python3-pip python3-numpy python3-dev \
        g++ clang \
        libgtk2.0-dev \
    && wget -q --no-check-certificate https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -O opencv.zip \
    && wget -q --no-check-certificate https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip -O opencv_contrib.zip \
    && unzip -qq opencv.zip -d . && rm -rf opencv.zip \
    && unzip -qq opencv_contrib.zip -d . && rm -rf opencv_contrib.zip \
    && cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_EXAMPLES=ON \
        /usr/src/opencv-4.x \
    && make -j$(nproc) \
    && make install \
    && ln -s /usr/local/lib/python3.10/dist-packages/cv2/python-3.10/cv2.cpython-310-x86_64-linux-gnu.so /usr/local/lib/python3.10/dist-packages/cv2/python-3.10/cv2.so \
    && apt-get -qq install cmake \
    && apt-get -qq install libeigen3-dev \
    && apt-get -qq install libgtest-dev \
    && cd /usr/src/gtest \
    && cmake CMakeLists.txt \
    && make \
    && cd lib \
    && cp *.a /usr/lib \
    && cd /usr/src/demoprg/src \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make

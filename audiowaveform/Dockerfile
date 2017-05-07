#
# Dockerfile for audiowaveform
#

FROM ubuntu
MAINTAINER kev <noreply@easypi.pro>

RUN apt-get update \
    && apt install -y cmake \
                      g++ \
                      gcc \
                      git-core \
                      libboost-filesystem1.54.0 \
                      libboost-filesystem-dev \
                      libboost-program-options1.54.0 \
                      libboost-program-options-dev \
                      libboost-regex1.54.0 \
                      libboost-regex-dev \
                      libgd2-xpm-dev \
                      libgd3 \
                      libmad0 \
                      libmad0-dev \
                      libsndfile1 \
                      libsndfile1-dev \
                      make \
                      unzip \
                      wget \
    && git clone https://github.com/bbcrd/audiowaveform.git \
        && cd audiowaveform \
        && wget https://googlemock.googlecode.com/files/gmock-1.7.0.zip \
        && unzip gmock-1.7.0.zip \
        && ln -s gmock-1.7.0 gmock \
        && mkdir build \
        && cd build \
        && cmake .. \
        && make install \
        && cd .. \
        && rm -rf audiowaveform \
    && apt-get purge --auto-remove -y cmake \
                                      g++ \
                                      gcc \
                                      git-core \
                                      libboost-filesystem-dev \
                                      libboost-program-options-dev \
                                      libboost-regex-dev \
                                      libgd2-xpm-dev \
                                      libmad0-dev \
                                      libsndfile1-dev \
                                      make \
                                      unzip \
                                      wget \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["audiowaveform"]
CMD ["--help"]


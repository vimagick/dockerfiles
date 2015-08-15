#
# Dockerfile for audiowaveform
#

FROM ubuntu
MAINTAINER kev <noreply@datageek.info>

RUN apt-update \
    && apt install -y cmake \
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
                      wget \
    && cd audiowaveform \
        && git clone https://github.com/bbcrd/audiowaveform.git . \
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
                                      wget \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["audiowaveform"]
CMD ["--help"]


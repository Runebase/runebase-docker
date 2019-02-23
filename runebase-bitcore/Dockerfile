FROM ubuntu
MAINTAINER pandazwb

RUN set -ex \
    && apt-get update \
    && apt-get install -y -qq --no-install-recommends ca-certificates git wget apt-utils \
    && apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl1.0-dev libevent-dev bsdmainutils \
    && apt-get install -y libboost-all-dev \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository -y ppa:bitcoin/bitcoin \
	&& apt-get update \
	&& apt-get install -y libdb4.8-dev libdb4.8++-dev \
	&& apt-get install -y libzmq3-dev \
 	&& rm -rf /var/lib/apt/lists/*

# install runebase from github
RUN cd /tmp && git clone --recursive https://github.com/runebase/runebase-bitcore.git \
	&& cd runebase-bitcore \
	&& ./autogen.sh \
	&& ./configure --without-gui \
	&& make install  \
	&& rm -rf /tmp/*

# create data directory
ENV RUNEBASE_DATA /data
RUN mkdir $RUNEBASE_DATA \
	&& ln -sfn $RUNEBASE_DATA /root/.runebase \
VOLUME /data

EXPOSE 9947 9432 19947 19432
CMD ["runebased"]

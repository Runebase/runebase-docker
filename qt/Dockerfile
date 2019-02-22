FROM ubuntu
MAINTAINER pandazwb

RUN set -ex \
    && apt-get update \
    && apt-get install -y -qq --no-install-recommends ca-certificates curl wget apt-utils jq \
    && apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools protobuf-compiler qrencode

# install runebase binaries
RUN set -ex \
    && echo `curl -s https://api.github.com/repos/runebase/runebase/releases/latest | jq -r ".assets[] | select(.name | test(\"x86_64-linux-gnu.tar.gz\")) | .browser_download_url"` > /tmp/runebase_url \
    && RUNEBASE_URL=`cat /tmp/runebase_url` \
    && RUNEBASE_DIST=$(basename $RUNEBASE_URL) \
    && wget -O $RUNEBASE_DIST $RUNEBASE_URL \
	&& tar -xzvf $RUNEBASE_DIST -C /usr/local --strip-components=1 \
	&& rm /tmp/runebase* \
	&& rm -rf /var/lib/apt/lists/*

# create data directory
ENV RUNEBASE_DATA /data
RUN mkdir $RUNEBASE_DATA \
	&& ln -sfn $RUNEBASE_DATA /root/.runebase \
VOLUME /data

EXPOSE 3888 3889 13888 13889
CMD ["runebase-qt"]

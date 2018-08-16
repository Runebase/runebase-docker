FROM qtum/qtum-bitcore

RUN apt-get update \
    && apt-get install -y -qq --no-install-recommends curl \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash \
    && apt-get install -y -qq --no-install-recommends \
      curl \
      bash \
      python \
      nodejs \
      gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN npm i https://github.com/qtumproject/qtumcore-node.git#master \
    && ln -s /node_modules/.bin/qtumcore-node /usr/local/bin/qtumcore-node \
    && qtumcore-node create mynode \
    && cd mynode \
    && qtumcore-node install https://github.com/qtumproject/insight-api.git#master \
    && qtumcore-node install https://github.com/qtumproject/qtum-explorer.git#master
# qtumcore-node
EXPOSE 3001

## install solar
RUN wget -v https://github.com/qtumproject/solar/releases/download/0.0.14/solar-linux-amd64 -O /usr/local/bin/solar && chmod 0755 /usr/local/bin/solar 

RUN ln -s /usr/local/bin/qtumd /node_modules/qtumcore-node/bin/qtumd
# qtumd
EXPOSE 18332

COPY qtumcore-node.json /etc/
COPY qtum.conf.template /etc/
COPY run.sh /
COPY qcli /usr/local/bin/

WORKDIR /mynode

ENV QTUM_DATADIR /data/.qtum
ENV QTUM_RPC_USER qtum
ENV QTUM_RPC_PASS test
ENV QTUM_RPC http://$QTUM_RPC_USER:$QTUM_RPC_PASS@localhost:18332
ENV QTUM_NETWORK regtest

# Entrypoint overload to catch the ctrl+c and stop signals
ENTRYPOINT ["/bin/bash", "/run.sh"]

CMD qtumcore-node start -c /etc/qtumcore-node.json

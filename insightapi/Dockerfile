FROM bago213/runebase-bitcore

RUN apt-get update \
    && apt-get install -y -qq --no-install-recommends curl \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y -qq --no-install-recommends \
      curl \
      bash \
      python \
      nodejs \
      gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN npm i https://github.com/runebase/runebasecore-node.git#master \
    && ln -s /node_modules/.bin/runebasecore-node /usr/local/bin/runebasecore-node \
    && runebasecore-node create mynode \
    && cd mynode \
    && runebasecore-node install https://github.com/runebase/insight-api.git#master \
    && runebasecore-node install https://github.com/runebase/runebase-explorer.git#master
# runebasecore-node
EXPOSE 3001

## install solar
RUN wget -v https://github.com/qtumproject/solar/releases/download/0.0.14/solar-linux-amd64 -O /usr/local/bin/solar && chmod 0755 /usr/local/bin/solar 

RUN ln -s /usr/local/bin/runebased /node_modules/runebasecore-node/bin/runebased
# runebased
EXPOSE 18332

COPY runebasecore-node.json /etc/
COPY runebase.conf.template /etc/
COPY run.sh /
COPY qcli /usr/local/bin/
RUN chmod +x /usr/local/bin/qcli

WORKDIR /mynode

ENV RUNEBASE_DATADIR /data/.runebase
ENV RUNEBASE_RPC_USER runebase
ENV RUNEBASE_RPC_PASS test
ENV RUNEBASE_RPC http://$RUNEBASE_RPC_USER:$RUNEBASE_RPC_PASS@localhost:18332
ENV RUNEBASE_NETWORK regtest

# Entrypoint overload to catch the ctrl+c and stop signals
ENTRYPOINT ["/bin/bash", "/run.sh"]

CMD runebasecore-node start -c /etc/runebasecore-node.json

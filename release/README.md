# Quickstart

## Get docker image

You might take either way:

### Pull a image from Public Docker hub

```
$ docker pull runebase/runebase
```

### Or, build runebase image with provided Dockerfile

```
$docker build --rm -t runebase/runebase .
```

For historical versions, please visit [docker hub](https://hub.docker.com/r/runebase/runebase/)

## Prepare data path and runebase.conf

In order to use user-defined config file, as well as save block chain data, -v option for docker is recommended.

First chose a path to save runebase block chain data:

```
sudo rm -rf /data/runebase-data
sudo mkdir -p /data/runebase-data
sudo chmod a+w /data/runebase-data
```

Create your config file, refer to the example [runebase.conf]!(https://github.com/runebase/runebase/blob/1a926b980f03e97322c7dd787835bec1730f35d2/contrib/debian/examples/runebase.conf). Note rpcuser and rpcpassword to required for later `runebase-cli` usage for docker, so it is better to set those two options. Then please create the file ${PWD}/runebase.conf with content:

```
rpcuser=runebase
rpcpassword=runebasetest
```
## Launch runebased

To launch runebase node:

```
## to launch runebased
$ docker run -d --rm --name runebase_node \
             -v ${PWD}/runebase.conf:/root/.runebase/runebase.conf \
             -v /data/runebase-data/:/root/.runebase/ \
             runebase/runebase runebased

## check docker processed
$ docker ps

## to stop runebased
$ docker run -i --network container:runebase_node \
             -v ${PWD}/runebase.conf:/root/.runebase/runebase.conf \
             -v /data/runebase-data/:/root/.runebase/ \
             runebase/runebase runebase-cli stop
```

`${PWD}/runebase.conf` will be used, and blockchain data saved under /data/runebase-data/

## Interact with `runebased` using `runebase-cli`

Use following docker command to interact with your runebase node with `runebase-cli`:

```
$ docker run -i --network container:runebase_node \
             -v ${PWD}/runebase.conf:/root/.runebase/runebase.conf \
             -v /data/runebase-data/:/root/.runebase/ \
             runebase/runebase runebase-cli getinfo
```

For more runebase-cli commands, use:

```
$ docker run -i --network container:runebase_node \
             -v ${PWD}/runebase.conf:/root/.runebase/runebase.conf \
             -v /data/runebase-data/:/root/.runebase/ \
             runebase/runebase runebase-cli help
```


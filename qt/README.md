# Quickstart

This is a runebase-qt image, launch GUI wallet

## Get docker image

To get the latest image, you might take either way:

### Pull a image from Public Docker hub

```
$ docker pull runebase/runebase-qt
```

### Or, build runebase image with provided Dockerfile

```
$docker build --rm -t runebase/runebase-qt .
```

For historical versions, please visit [docker hub](https://hub.docker.com/r/runebase/runebase-qt/)

## Prepare data path & runebase.conf

In order to use user-defined config file, as well as save block chain data, -v option for docker is recommended.

First chose a path to save runebase block chain data:

```
sudo rm -rf /data/runebase-data
sudo mkdir -p /data/runebase-data
sudo chmod a+w /data/runebase-data
```

Create your config file, refer to the example [runebase.conf]!(https://github.com/runebase/runebase/blob/1a926b980f03e97322c7dd787835bec1730f35d2/contrib/debian/examples/runebase.conf). Then please create the file ${PWD}/runebase.conf with content:

```
rpcuser=runebase
rpcpassword=runebasetest
```

User can set their own config file on demands.

## Launch runebase-qt

For Linux:

```
$ docker run -it --rm \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -v ${PWD}/runebase.conf:/root/.runebase/runebase.conf \
             -v /data/runebase-data/:/root/.runebase/ \
             -e DISPLAY  runebase/runebase-qt
```

For Mac:

Please refer to
[https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc](https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc) about how to run gui with docker on mac.

```
## install & launch socat
$ brew install socat
$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

## install & open Xquartz
$ brew install xquartz
$ open -a Xquartz

## then set Xquartz preferences "Security-'Allow connections from network clients'"

## launch runebase-qt 
$ docker run -e DISPLAY=<your_ip>:0 -v ${PWD}/runebase.conf:/root/.runebase/runebase.conf -v /data/runebase-data/:/root/.runebase/ runebase/runebase-qt

```


`${PWD}/runebase.conf` will be used, and blockchain data saved under /data/runebase-data/


## exit runebase-qt

Exit the gui wallet in normal way.



# runebase-docker

Runebase docker image

## What is Runebase?

Runebase is a new blockchain based on Bitcoin Core that integrates Ethereum based smart contracts. It implements an extensible design which is capable of adding more VMs, enabled primarily through the Account Abstraction Layer, which allows for an account based virtual machine to function on a UTXO based blockchain.

Please refer to : https://github.com/runebase/runebase

## Dockerfile

The repo contains two Runebase Dockerfiles:

* The Dockerfile with latest release version of `runebased` and `runebase-cli`, which could be found in `/release`
* The Dockerfile build directly with latest dev src in github, which could be found in `/dev`

## Docker images

The docker images are also available in docker hub.

Note: If you want to keep the latest update, please use the Dockerfile above to create your own image.

The latest release version: 

```
docker pull runebase/runebase:latest
```

The dev version:

```
docker pull runebase/runebase:dev
```

The GUI version:

```
docker pull runebase/runebase:runebase-qt
```

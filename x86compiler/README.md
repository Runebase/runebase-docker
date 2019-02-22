# Quickstart

This is a Docker container of [Runebase-x86-toolchian](https://github.com/runebase/x86-toolchain). All required
environments are included in the docker image, and developers can use this compiler directly.

## About Runebase x86-toolchain

Currently, x86-toolchain is a GNU GCC and friends toolchain modified to support the "i386-runebase" target. This means that after building this, it is possible to simply do:

```
i386-runebase-gcc test.c -o contract
```

And the "contract" file that is outputed will be capable of being used with the x86Lib testbench program (and later deployed to Runebase's blockchain)

Note: even though x86Lib will later support i686, right now there is only i386 support.. so only target this!

## Get docker image

You might take either way:

### Pull a image from Public Docker hub

```
$ docker pull runebase/x86compiler
```

### Or, build runebase image with provided Dockerfile

```
$docker build --rm -t runebase/x86compiler .
```

For historical versions, please visit [docker hub](https://hub.docker.com/r/runebase/x86compiler/tags/)

## Prepare data path 

It is suggested to prepare a data path in advance, in order to mount to container. -v option for docker is recommended.

First chose a path to save source files, for example:

```
sudo rm -rf /data/runebase-x86-data
sudo mkdir -p /data/runebase-x86-data
sudo chmod a+w /data/runebase-x86-data
```

And put you source file (like the test.c provided in the repo) into the path.

Or you can choose an existing path that includes those source file.

## run x86compiler container

First check the gcc version:

```
$ docker run --rm runebase/x86compiler i386-runebase-gcc -v

## result:

Using built-in specs.
COLLECT_GCC=i386-runebase-gcc
COLLECT_LTO_WRAPPER=/opt/cross/libexec/gcc/i386-runebase/7.2.0/lto-wrapper
Target: i386-runebase
Configured with: ../gcc-7.2.0/configure --target=i386-runebase --prefix=/opt/cross --with-sysroot=/root/x86-compiler/sysroot --enable-languages=c
Thread model: single
gcc version 7.2.0 (GCC) 

```

To use i386-runebase-gcc:

```
$ docker run --rm  \
             -v /data/runebase-x86-data/:/data/ \
             runebase/x86compiler \
             i386-runebase-gcc /data/test.c -o /data/test.elf
```

Since the `/data/runebase-x86-data` is mounted to /data in the container, this will compile test.c in the path and create
create output file test.elf in the same path.


## Interactive run

If you want to run the compiler in an interactive way,

```
$ docker run --rm -it \
             -v /data/runebase-x86-data/:/data/ \
             runebase/x86compiler \
             bash
```

Then you can use the bash of the container just like in Ubuntu command line:

```
root@11d4d98b45f1:/# i386-runebase-gcc /data/test.c -o /data/test.elf
```

For the local machine, the output files will also be placed in the path passed by -v option. (here it is /data/runebase-x86-data/).

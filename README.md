# ps2dev

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ps2dev/ps2dev/compilation.yml?branch=master&label=CI&logo=github&style=for-the-badge)](https://github.com/ps2dev/ps2dev/actions?query=workflow%3ACI)[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ps2dev/ps2dev/docker.yml?branch=master&label=CI&logo=github&style=for-the-badge)](https://github.com/ps2dev/ps2dev/actions?query=workflow%3ACI-Docker)[![Docker Pulls](https://img.shields.io/docker/pulls/ps2dev/ps2dev?style=for-the-badge)](https://hub.docker.com/r/ps2dev/ps2dev/tags)

Main PS2 Repo for building the whole `PS2 Development` environment in your local machine.

This program will automatically build and install the whole compiler and other tools used in the creation of homebrew software for the Sony PlayStation® 2 videogame system.

## What these scripts do

These scripts download (`git clone`) and install:

-   [ps2toolchain](https://github.com/ps2dev/ps2toolchain "ps2toolchain")
-   [ps2sdk](https://github.com/ps2dev/ps2sdk "ps2sdk")
-   [ps2sdk-ports](https://github.com/ps2dev/ps2sdk-ports "ps2sdk-ports")
-   [gsKit](https://github.com/ps2dev/gsKit "gsKit")
-   [ps2-packer](https://github.com/ps2dev/ps2-packer "ps2-packer")
-   [ps2client](https://github.com/ps2dev/ps2client "ps2client")

## Requirements

1.  Install gcc/clang, make, cmake, patch, git, texinfo, flex, bison, gettext, wget, gsl, gmp, zlib, mpfr and mpc if you don't have those packages.
2.  _Optional._ If you are upgrading from the previous version of the PS2DEV environment, it is highly recommended to remove the content of the PS2DEV folder before upgrade. This is a necessary step after the major toolchain upgrade.
```bash
sudo rm -rf $PS2DEV
```
3.  Ensure that you have enough permissions for managing PS2DEV location (which defaults to `/usr/local/ps2dev`, but you can use a different path). PS2DEV location MUST NOT have spaces or special characters in its path! PS2DEV should be an absolute path. On Unix systems, if the command `mkdir -p $PS2DEV` fails for you, you can set access for the current user by running commands:
```bash
export PS2DEV=/usr/local/ps2dev
sudo mkdir -p $PS2DEV
sudo chown -R $USER: $PS2DEV
```
4.  Add this to your login script (example: `~/.bash_profile`)
    **Note:** Ensure that you have full access to the PS2DEV path. You can change the PS2DEV path with the following requirements: only use absolute paths, don't use spaces, only use Latin characters.
```bash
export PS2DEV=/usr/local/ps2dev
export PS2SDK=$PS2DEV/ps2sdk
export GSKIT=$PS2DEV/gsKit
export PATH=$PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin
```
5.  Run build-all.sh
```bash
./build-all.sh
```

## Docker generation

This repo also uses CI/CD to create a docker image called `ps2dev/ps2dev:latest` per change. This is useful if you're a developer that wants to create/port an application to the PS2. You can compile your project using this docker image.

## Extra steps

If you want, you can _JUST_ install the extra dependencies `ps2client` and `ps2-packer`. To achieve this, execute the following:
```bash
./build-extra.sh
```

### macOS

If you download the pre-built macOS binaries and get a security error such as _`"ps2client" cannot be opened because the developer cannot be verified.`_, you can remove the quarantine attribute by running:
```bash
xattr -dr com.apple.quarantine path/to/prebuilt/ps2toolchain
```

## Thanks

# ps2dev

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ps2dev/ps2dev/compilation.yml?branch=master&label=CI&logo=github&style=for-the-badge)](https://github.com/ps2dev/ps2dev/actions?query=workflow%3ACI)[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ps2dev/ps2dev/docker.yml?branch=master&label=CI&logo=github&style=for-the-badge)](https://github.com/ps2dev/ps2dev/actions?query=workflow%3ACI-Docker)[![Docker Pulls](https://img.shields.io/docker/pulls/ps2dev/ps2dev?style=for-the-badge)](https://hub.docker.com/r/ps2dev/ps2dev/tags)
&nbsp;  
This is the main PS2 Repo for building the whole `PS2 Development` environment in your local machine.  
&nbsp;  
This program will automatically build and install the whole compiler and other tools used in the creation of homebrew software for the Sony PlayStation® 2 videogame system.  

&nbsp;  
**Note:** previously bash scripts were used to clone and build the toolchain and associated libraries; however, the repository is now using `git submodules` and makefiles to make building and developing easier.  
&nbsp;  
The use of submodules makes building and development easier because you only need to clone the repositories once instead of cloning them on every invocation of the build script.  
&nbsp;  
In other words, using the build scripts, as they were, it would be many builds to many clones. However, cloning via submodules makes it one clone to many builds, and it also allows for local changes to be made without having those changes wiped-out when the script does a hard-reset on the repository.

## Requirements

1.  Install gcc/clang, make, cmake, patch, git, texinfo, flex, bison, gettext, wget, gsl, gmp, zlib, mpfr and mpc if you don't have those packages.  
&nbsp;
1.  _Optional._ If you are upgrading from the previous version of the PS2DEV environment, it is highly recommended to remove the content of the PS2DEV folder before upgrade. This is a necessary step after the major toolchain upgrade.
    ```bash
    rm -rf $PS2DEV
    
    # if installed to a system folder
    
    sudo rm -rf $PS2DEV
    ```
1.  **This only applies if you install to a system folder**  
&nbsp;  
It is recommended to install to your home folder.  
&nbsp;  
Ensure that you have enough permissions for managing PS2DEV location (which defaults to `/usr/local/ps2dev`, but you can use a different path). PS2DEV location MUST NOT have spaces or special characters in its path! PS2DEV should be an absolute path. On Unix systems, if the command `mkdir -p $PS2DEV` fails for you, you can set access for the current user by running commands:
    ```bash
    export PS2DEV=/usr/local/ps2dev
    sudo mkdir -p $PS2DEV
    sudo chown -R $USER: $PS2DEV
    ```
1.  Add this to your login script (example: `~/.bash_profile`)
    **Note:** Ensure that you have full access to the PS2DEV path. You can change the PS2DEV path with the following requirements: only use absolute paths, don't use spaces, only use Latin characters.  
    ```bash
    export PS2DEV=$HOME/ps2dev
    export PS2SDK=$PS2DEV/ps2sdk
    export GSKIT=$PS2DEV/gsKit
    export PATH=$PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin
    ```  
    **Note:** if you want to make these changes globally (ie. not per-user) then you can change the **PS2DEV** path to a system folder (like /usr/local/ps2dev) and add the above varibables to /etc/bash.bashrc (instead of ~/.bash_profile, etc).  
    &nbsp;
    
1.  Run make to checkout the submodules
    ```bash
    $ make dist_clean
    ```

1.  Run make without an argument (to build everything) or supply a target to build.  
    &nbsp;  
    **Typical make steps**:
    ```bash
    # do this once (and only as needed)
    $ make dist_clean
    
    # clean the PS2DEV folder (again only as needed, see step 2)
    $ make clean-ps2dev
    
    # clean the build folder
    $ make clean
    
    # build the toolchain, ps2sdk (and ports)
    $ make ps2toolchain ps2sdk ps2sdk-ports
    
    # build extras (if you want them)
    $ make extras
    ```
    
    For development purposes you can prefix `VERBOSE=1` to the make commands to show all of the compilation outoput.
    ```bash
    $ VERBOSE=1 make ps2toolchain
    ```
**Available make targets (*listed in build order*)**:  
&nbsp;  
&nbsp;&nbsp;&nbsp;&nbsp;**Each nested target is equivalent to executing its parent target.**
&nbsp;
+ **dist_clean** = checkout/reset/and sync submodules
+ **clean** = clean build folder
+ **clean-ps2dev** = clean $(PS2DEV) folder
+ **no argument or all** = builds all of the below targets
+ **ps2toolchain**:
    + **ps2toolchain-dvp**:
        + **ps2toolchain-dvp-binutils**
    + **ps2toolchain-iop**:
        + **ps2toolchain-iop-binutils**
        + **ps2toolchain-iop-gcc-stage1**
    + **ps2toolchain-ee**:  
        + **ps2toolchain-ee-binutils**
        + **ps2toolchain-ee-gcc-stage1**
        + **ps2toolchain-ee-newlib**
        + **ps2toolchain-ee-newlib-nano**
        + **ps2toolchain-ee-pthread**
        + **ps2toolchain-ee-gcc-stage2**
+ **ps2sdk**
+ **ps2sdk-ports**
+ **extras**:
    + **ps2-packer**
    + **ps2client**
    + **ps2link**

The ps2toolchain and extras target, also have sub-targets, and depending on the configuration set in ***makefiles/ps2toolchain/includes.mk*** and ***makefiles/extras/includes.mk***, the following variables will control if sub-targets are shown (to hide targets they should be set to '.'):

+ **PS2TOOLCHAIN_HIDE_COMPILER_TARGETS**
+ **PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS**
+ **EXTRAS_HIDE_TARGETS**

**Note:** the **INSTALL_PREFIX** variable in **makefiles/user_paths.mk** can be altered to setup a custom installation path -- by default the prefix is $HOME (the user's home directory), but it could be changed to **/usr/local**, or etc; however, if it is to be installed to a system path it would require running make as root. Also be sure that these paths match what you setup in step 4.

## Docker generation

This repo also uses CI/CD to create a docker image called `ps2dev/ps2dev:latest` per change. This is useful if you're a developer that wants to create/port an application to the PS2. You can compile your project using this docker image.  
&nbsp;  
**Note:** The switch to submodules and makefiles has not been tested with the
dockerfile, so it may not work.

### macOS

If you download the pre-built macOS binaries and get a security error such as _`"ps2client" cannot be opened because the developer cannot be verified.`_, you can remove the quarantine attribute by running:
```bash
xattr -dr com.apple.quarantine path/to/prebuilt/ps2toolchain
```

## Thanks

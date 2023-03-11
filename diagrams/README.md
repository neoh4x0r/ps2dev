**This serves to document the build order, repositories, and branches (for ps2dev)**:

---
Note: each of the "leaf repositories" has been included, using git submodules,
instead of needing to use a build script to clone them.

A "leaf repository," as used here, is an actual build target and does not
reference another repository.

For example, **binutils-gdb** would be a leaf for **ps2toolchain-dvp**,
**ps2toolchain-iop**, and **ps2toolchain-ee**

---

+ **[required] ps2toolchain** (branch: [master](https://github.com/ps2dev/ps2toolchain/tree/master))
  
    + **ps2toolchain-dvp** (branch: [main](https://github.com/ps2dev/ps2toolchain-dvp/tree/main))
    
        + **binutils-gdb** (branch: [dvp-v2.14](https://github.com/ps2dev/binutils-gdb/tree/dvp-v2.14))
        
    + **ps2toolchain-iop** (branch: [main](https://github.com/ps2dev/ps2toolchain-iop/tree/main))
    
        + **binutils-gdb** (branch: [iop-v2.35.2](https://github.com/ps2dev/binutils-gdb/tree/iop-v2.35.2))
        + **[stage 1] gcc** (branch: [iop-v11.3.0](https://github.com/ps2dev/gcc/tree/iop-v11.3.0))

    + **ps2toolchain-ee** (branch: [main](https://github.com/ps2dev/ps2toolchain-ee/tree/main))
    
        + **binutils-gdb** (branch: [ee-v2.38.0](https://github.com/ps2dev/binutils-gdb/tree/ee-v2.38.0))
        + **[stage 1] gcc** (branch: [ee-v11.3.0](https://github.com/ps2dev/gcc/tree/ee-v11.3.0))
        + **newlib** (branch: [ee-v4.1.0](https://github.com/ps2dev/newlib/tree/ee-v4.1.0))        
        + **[nano] newlib** (branch: [ee-v4.1.0](https://github.com/ps2dev/newlib/tree/ee-v4.1.0))
        + **pthread-embedded** (branch: [platform_agnostic](https://github.com/ps2dev/pthread-embedded/tree/platform_agnostic))
        + **[stage 2] gcc** (branch: [ee-v11.3.0](https://github.com/ps2dev/gcc/tree/ee-v11.3.0))
        
+ **[required] ps2sdk** (branch: [master](https://github.com/ps2dev/ps2sdk/tree/master))

+ **[recommended] ps2sdk-ports** (branch: [master](https://github.com/ps2dev/ps2sdk-ports/tree/master))

+ **[optional] ps2-packer** (branch: [master](https://github.com/ps2dev/ps2-packer/tree/master))

+ **[optional] ps2client** (branch: [master](https://github.com/ps2dev/ps2client/tree/master))

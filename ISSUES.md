===
#**ISSUES**
===

+ **2023/03/11** -- **ps2toolchain-ee-newlib (branch: ee-v4.1.0)**

```
/bin/bash: line 1: mips64r5900el-ps2-elf-cc: command not found
```

I don't know if **mips64r5900el-ps2-elf-cc** isn't being created by binutils (or gcc),
or if newlib should should be using **mips64r5900el-ps2-elf-gcc** instead.

===

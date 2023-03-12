TARGET_PS2TOOLCHAIN_EE=ee

EE_MAKE_PATH := $(PS2TOOLCHAIN)/$(TARGET_PS2TOOLCHAIN_EE)
EE_INCLUDE_PATH := makefiles/$(EE_MAKE_PATH)/$(TARGET_PS2TOOLCHAIN_EE)

EE_COMPILE_TARGETS += "mips64r5900el-ps2-elf"

# MAKE TARGETS
EE_MAKE_TARGET := $(PS2TOOLCHAIN)-$(TARGET_PS2TOOLCHAIN_EE)
EE_MAKE_TARGET_BINUTILS := $(PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS)$(EE_MAKE_TARGET)-binutils
EE_MAKE_TARGET_GCC_STAGE1 := $(PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS)$(EE_MAKE_TARGET)-gcc-stage1
EE_MAKE_TARGET_NEWLIB := $(PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS)$(EE_MAKE_TARGET)-newlib
EE_MAKE_TARGET_NEWLIB_NANO:= $(PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS)$(EE_MAKE_TARGET)-newlib-nano
EE_MAKE_TARGET_PTHREAD := $(PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS)$(EE_MAKE_TARGET)-pthread
EE_MAKE_TARGET_GCC_STAGE2 := $(PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS)$(EE_MAKE_TARGET)-gcc-stage2

# DIRECTORIES FOR TARGETS
EE_DIR_TARGET_BINUTILS := $(EE_MAKE_PATH)/binutils
EE_DIR_TARGET_GCC_STAGE1 := $(EE_MAKE_PATH)/gcc-stage1
EE_DIR_TARGET_NEWLIB := $(EE_MAKE_PATH)/newlib
EE_DIR_TARGET_NEWLIB_NANO := $(EE_MAKE_PATH)/newlib-nano
EE_DIR_TARGET_PTHREAD := $(EE_MAKE_PATH)/pthread
EE_DIR_TARGET_GCC_STAGE2 := $(EE_MAKE_PATH)/gcc-stage2

# MAKE DEPS
EE_DEPS += .depends
EE_DEPS += $(EE_MAKE_TARGET_BINUTILS)
EE_DEPS += $(EE_MAKE_TARGET_GCC_STAGE1)
EE_DEPS += $(EE_MAKE_TARGET_NEWLIB)
EE_DEPS += $(EE_MAKE_TARGET_NEWLIB_NANO)
EE_DEPS += $(EE_MAKE_TARGET_PTHREAD)
EE_DEPS += $(EE_MAKE_TARGET_GCC_STAGE2)

include $(EE_INCLUDE_PATH)-binutils.mk
include $(EE_INCLUDE_PATH)-gcc-stage1.mk
include $(EE_INCLUDE_PATH)-newlib.mk
include $(EE_INCLUDE_PATH)-newlib-nano.mk
include $(EE_INCLUDE_PATH)-pthread.mk
include $(EE_INCLUDE_PATH)-gcc-stage2.mk

$(PS2TOOLCHAIN_HIDE_COMPILER_TARGETS)$(EE_MAKE_TARGET): $(EE_DEPS)

am_$(PS2TOOLCHAIN)_targets += $(PS2TOOLCHAIN_HIDE_COMPILER_TARGETS)$(EE_MAKE_TARGET)

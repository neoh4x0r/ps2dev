TARGET_PS2TOOLCHAIN_EE=ee
ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE):
	@echo "$@ not implemented"

am_build_targets += ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)

PS2TOOLCHAIN_TARGETS += ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)

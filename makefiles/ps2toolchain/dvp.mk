TARGET_PS2TOOLCHAIN_DVP=dvp

.ps2toolchain-$(TARGET_PS2TOOLCHAIN_DVP)-binutils: .depends
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_DVP)/binutils")
	@cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_DVP)/binutils" && \
		rm -rf "build-$(TARGET_PS2TOOLCHAIN_DVP)" && \
		mkdir "build-$(TARGET_PS2TOOLCHAIN_DVP)" && \
		cd "build-$(TARGET_PS2TOOLCHAIN_DVP)" && \
		CFLAGS="$(am_dvp_binutils_cflags)" ../configure \
			--quiet \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_DVP)" \
			--target="$(TARGET_PS2TOOLCHAIN_DVP)" \
			--disable-nls \
			--disable-build-warnings \
			$(TARG_XTRA_OPTS) && \
		$(MAKE) --quiet -j$(NUM_JOBS) CFLAGS="$(CFLAGS) -D_FORTIFY_SOURCE=0 -O2 -Wno-implicit-function-declaration" LDFLAGS="$(LDFLAGS) -s" && \
		$(MAKE) --quiet -j$(NUM_JOBS) install
		$(MAKE) --quiet -j$(NUM_JOBS) clean

ps2toolchain-$(TARGET_PS2TOOLCHAIN_DVP): .ps2toolchain-$(TARGET_PS2TOOLCHAIN_DVP)-binutils


am_build_targets += ps2toolchain-$(TARGET_PS2TOOLCHAIN_DVP)

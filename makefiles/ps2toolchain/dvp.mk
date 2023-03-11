TARGET_PS2TOOLCHAIN_DVP=dvp

DVP_TARGETS += "dvp"

DVP_DEPS += .depends
DVP_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_DVP)-binutils

.ps2toolchain-$(TARGET_PS2TOOLCHAIN_DVP)-binutils:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_DVP)/binutils")
	@for TARGET in $(DVP_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_DVP)/binutils"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		cd "build-$$TARGET"; \
		CFLAGS="$(am_dvp_binutils_cflags)" ../configure \
			--quiet \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_DVP)" \
			--target="$$TARGET" \
			--disable-nls \
			--disable-build-warnings \
			$(TARG_XTRA_OPTS); \
		$(MAKE) --quiet -j $(NUM_JOBS) CFLAGS="$(CFLAGS) -D_FORTIFY_SOURCE=0 -O2 -Wno-implicit-function-declaration" LDFLAGS="$(LDFLAGS) -s"; \
		$(MAKE) --quiet -j $(NUM_JOBS) install; \
	done

ps2toolchain-$(TARGET_PS2TOOLCHAIN_DVP): $(DVP_DEPS)

am_ps2toolchain_targets += ps2toolchain-$(TARGET_PS2TOOLCHAIN_DVP)

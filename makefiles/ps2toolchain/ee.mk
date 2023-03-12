TARGET_PS2TOOLCHAIN_EE=ee

EE_TARGETS += "mips64r5900el-ps2-elf"

EE_DEPS += .depends
EE_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-binutils
EE_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-gcc-stage1
EE_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-newlib
EE_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-newlib-nano
EE_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-pthread
EE_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-gcc-stage2

#####################
## binutils
#####################
.ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-binutils:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/binutils")
	@for TARGET in $(EE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/binutils"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		cd "build-$$TARGET"; \
		../configure \
			--quiet \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)" \
			--target="$$TARGET" \
			--disable-separate-code \
			--disable-sim \
			--disable-nls \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
	done
#####################


#####################
## ee-gcc-stage1
#####################
.ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-gcc-stage1:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/gcc-stage1")
	@for TARGET in $(EE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/gcc-stage1"; \
		rm -rf "build-$$TARGET-stage1"; \
		mkdir "build-$$TARGET-stage1"; \
		cd "build-$$TARGET-stage1"; \
		../configure \
			--quiet \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)" \
			--target="$$TARGET" \
			--enable-languages="c" \
			--with-float=hard \
			--without-headers \
			--without-newlib \
			--disable-libssp \
			--disable-multilib \
			--disable-tls \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
	done
#####################


#####################
## ee-newlib
#####################
.ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-newlib:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/newlib")
	@for TARGET in $(EE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/newlib"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		cd "build-$$TARGET"; \
		CFLAGS_FOR_TARGET="-O2" ../configure \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)" \
			--target="$$TARGET" \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
	done
#####################


#####################
## ee-newline-nano
#####################
.ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-newlib-nano:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/newlib-nano")
	@for TARGET in $(EE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/newlib-nano"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		mkdir "build-tmp"; \
		cd "build-$$TARGET"; \
		CFLAGS_FOR_TARGET="-DPREFER_SIZE_OVER_SPEED=1 -Os" ../configure \
			--prefix="./build-tmp" \
			--target="$$TARGET" \
			--disable-newlib-supplied-syscalls \
			--enable-newlib-reent-small \
			--disable-newlib-fvwrite-in-streamio \
			--disable-newlib-fseek-optimization \
			--disable-newlib-wide-orient \
			--enable-newlib-nano-malloc \
			--disable-newlib-unbuf-stream-opt \
			--enable-lite-exit \
			--enable-newlib-global-atexit \
			--enable-newlib-nano-formatted-io \
			--disable-nls \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
		mv "./build-tmp/$$TARGET/lib/libc.a" "$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)/$$TARGET/lib/libc_nano.a" 2>&1 | tee -a $(LOGFILE); \
		mv "./build-tmp/$$TARGET/lib/libg.a" "$PS2DEV/$(TARGET_PS2TOOLCHAIN_EE)/$$TARGET/lib/libg_nano.a" 2>&1 | tee -a $(LOGFILE); \
		mv "./build-tmp/$$TARGET/lib/libm.a" "$PS2DEV/$(TARGET_PS2TOOLCHAIN_EE)/$$TARGET/lib/libm_nano.a" 2>&1 | tee -a $(LOGFILE); \
	done
#####################


#####################
## ee-pthread
#####################
.ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-pthread:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/pthread")
	@for TARGET in $(EE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/pthread/platform/ps2"; \	
		$(MAKE) --quiet -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" install 2>&1 | tee -a $(LOGFILE); \
	done
#####################


#####################
## ee-gcc-stage2
#####################
.ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)-gcc-stage2:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/gcc-stage2")
	@for TARGET in $(EE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_EE)/gcc-stage2"; \
		rm -rf "build-$$TARGET-stage2"; \
		mkdir "build-$$TARGET-stage2"; \
		cd "build-$$TARGET-stage2"; \
		../configure \
			--quiet \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)" \
			--target="$@TARGET" \
			--enable-languages="c,c++" \
			--with-float=hard \
			--with-sysroot="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)/$$TARGET" \
			--with-newlib \
			--disable-libssp \
			--disable-multilib \
			--disable-tls \
			--enable-cxx-flags=-G0 \
			--enable-threads=posix \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
	done
#####################

ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE): $(EE_DEPS)
	
am_ps2toolchain_targets += ps2toolchain-$(TARGET_PS2TOOLCHAIN_EE)

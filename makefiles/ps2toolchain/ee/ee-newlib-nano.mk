$(EE_MAKE_TARGET_NEWLIB_NANO):
	@$(call stage,"$(EE_DIR_TARGET_NEWLIB_NANO)")
	@for TARGET in $(EE_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(EE_DIR_TARGET_NEWLIB_NANO)"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		mkdir -p "$(EE_DIR_TARGET_NEWLIB_NANO_TMP)"; \
		cd "build-$$TARGET"; \
		$(call log_configure,$(EE_MAKE_TARGET_NEWLIB_NANO),$$TARGET); \
		CFLAGS_FOR_TARGET="-DPREFER_SIZE_OVER_SPEED=1 -Os" ../configure \
			$(BUILD_QUIET) \
			--prefix="$(BUILD_FOLDER)/$(EE_DIR_TARGET_NEWLIB_NANO_TMP)" \
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
		$(call log_make,$(EE_MAKE_TARGET_NEWLIB_NANO),$$TARGET); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
		mv "$(BUILD_FOLDER)/$(EE_DIR_TARGET_NEWLIB_NANO_TMP)/$$TARGET/lib/libc.a" "$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)/$$TARGET/lib/libc_nano.a"; \
		mv "$(BUILD_FOLDER)/$(EE_DIR_TARGET_NEWLIB_NANO_TMP)/$$TARGET/lib/libg.a" "$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)/$$TARGET/lib/libg_nano.a"; \
		mv "$(BUILD_FOLDER)/$(EE_DIR_TARGET_NEWLIB_NANO_TMP)/$$TARGET/lib/libm.a" "$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)/$$TARGET/lib/libm_nano.a"; \
	done

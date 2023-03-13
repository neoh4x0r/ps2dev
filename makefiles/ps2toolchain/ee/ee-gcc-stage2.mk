$(EE_MAKE_TARGET_GCC_STAGE2):
	@$(call stage,"$(EE_DIR_TARGET_GCC_STAGE2)")
	@for TARGET in $(EE_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(EE_DIR_TARGET_GCC_STAGE2)"; \
		rm -rf "build-$$TARGET-stage2"; \
		mkdir "build-$$TARGET-stage2"; \
		cd "build-$$TARGET-stage2"; \
		$(call log_configure,$(EE_MAKE_TARGET_GCC_STAGE2),$$TARGET); \
		../configure \
			$(BUILD_QUIET) \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)" \
			--target="$$TARGET" \
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
		$(call log_make,$(EE_MAKE_TARGET_GCC_STAGE2),$$TARGET); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
	done

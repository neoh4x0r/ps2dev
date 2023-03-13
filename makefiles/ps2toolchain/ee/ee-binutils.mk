$(EE_MAKE_TARGET_BINUTILS):
	@$(call stage,"$(EE_DIR_TARGET_BINUTILS)")
	@for TARGET in $(EE_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(EE_DIR_TARGET_BINUTILS)"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		cd "build-$$TARGET"; \
		$(call log_configure,$(EE_MAKE_TARGET_BINUTILS),$$TARGET); \
		../configure \
			$(CONFIGURE_QUIET) \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)" \
			--target="$$TARGET" \
			--disable-separate-code \
			--disable-sim \
			--disable-nls \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(call log_make,$(EE_MAKE_TARGET_BINUTILS),$$TARGET); \
		$(MAKE) $(MAKE_QUIET) -j "$(NUM_JOBS)" 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(MAKE_QUIET) -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
	done

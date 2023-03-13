$(EE_MAKE_TARGET_NEWLIB):
	@$(call stage,"$(EE_DIR_TARGET_NEWLIB)")
	@for TARGET in $(EE_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(EE_DIR_TARGET_NEWLIB)"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		cd "build-$$TARGET"; \
		$(call log_configure,$(EE_MAKE_TARGET_NEWLIB),$$TARGET); \
		CFLAGS_FOR_TARGET="-O2" ../configure \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_EE)" \
			--target="$$TARGET" \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(call log_make,$(EE_MAKE_TARGET_NEWLIB),$$TARGET); \
		$(MAKE) $(MAKE_QUIET) -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(MAKE_QUIET) -j "$(NUM_JOBS)" install-strip 2>&1 | tee -a $(LOGFILE); \
	done

$(IOP_MAKE_TARGET_BINUTILS):
	@$(call stage,"$(IOP_DIR_TARGET_BINUTILS)")
	@for TARGET in $(IOP_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(IOP_DIR_TARGET_BINUTILS)"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		cd "build-$$TARGET"; \
		../configure \
			--quiet \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_IOP)" \
			--target="$$TARGET" \
			--disable-separate-code \
			--disable-sim \
			--disable-nls \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j $(NUM_JOBS) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j $(NUM_JOBS) install-strip 2>&1 | tee -a $(LOGFILE); \
	done

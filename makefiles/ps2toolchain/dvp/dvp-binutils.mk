$(DVP_MAKE_TARGET_BINUTILS):
	@$(call stage,"$(DVP_DIR_TARGET_BINUTILS)")
	@for TARGET in $(DVP_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(DVP_DIR_TARGET_BINUTILS)"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		cd "build-$$TARGET"; \
		$(call log_configure,$(DVP_MAKE_TARGET_BINUTILS),$$TARGET); \
		CFLAGS="$(am_dvp_binutils_cflags)" ../configure \
			$(BUILD_QUIET) \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_DVP)" \
			--target="$$TARGET" \
			--disable-nls \
			--disable-build-warnings \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(call log_make,$(DVP_MAKE_TARGET_BINUTILS),$$TARGET); \
		$(MAKE) $(BUILD_QUIET) -j $(MAX_JOBS) CFLAGS="$(CFLAGS) -D_FORTIFY_SOURCE=0 -O2 -Wno-implicit-function-declaration" LDFLAGS="$(LDFLAGS) -s"  2>&1 | tee -a $(LOGFILE) ; \
		$(MAKE) $(BUILD_QUIET) -j $(MAX_JOBS) install 2>&1 | tee -a $(LOGFILE); \
	done
	

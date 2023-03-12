$(DVP_MAKE_TARGET_BINUTILS):
	@$(call stage,"$(DVP_DIR_TARGET_BINUTILS)")
	@for TARGET in $(DVP_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(DVP_DIR_TARGET_BINUTILS)"; \
		rm -rf "build-$$TARGET"; \
		mkdir "build-$$TARGET"; \
		cd "build-$$TARGET"; \
		CFLAGS="$(am_dvp_binutils_cflags)" ../configure \
			--quiet \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_DVP)" \
			--target="$$TARGET" \
			--disable-nls \
			--disable-build-warnings \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j $(NUM_JOBS) CFLAGS="$(CFLAGS) -D_FORTIFY_SOURCE=0 -O2 -Wno-implicit-function-declaration" LDFLAGS="$(LDFLAGS) -s"  2>&1 | tee -a $(LOGFILE) ; \
		$(MAKE) --quiet -j $(NUM_JOBS) install 2>&1 | tee -a $(LOGFILE); \
	done
	
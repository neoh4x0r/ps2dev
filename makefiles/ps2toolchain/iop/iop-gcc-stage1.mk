$(IOP_MAKE_TARGET_GCC_STAGE1):
	@$(call stage,"$(IOP_DIR_TARGET_GCC_STAGE1)")
	@for TARGET in $(IOP_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(IOP_DIR_TARGET_GCC_STAGE1)"; \
		rm -rf "build-$$TARGET-stage1"; \
		mkdir "build-$$TARGET-stage1"; \
		cd "build-$$TARGET-stage1"; \
		$(call log_configure,$(IOP_MAKE_TARGET_GCC_STAGE1),$$TARGET); \
		../configure \
			$(BUILD_QUIET) \
			--prefix="$(PS2DEV)/$(TARGET_PS2TOOLCHAIN_IOP)" \
			--target="$$TARGET" \
			--enable-languages="c" \
			--with-float=soft \
			--with-headers=no \
			--without-newlib \
			--without-cloog \
			--without-ppl \
			--disable-decimal-float \
			--disable-libada \
			--disable-libatomic \
			--disable-libffi \
			--disable-libgomp \
			--disable-libmudflap \
			--disable-libquadmath \
			--disable-libssp \
			--disable-libstdcxx-pch \
			--disable-multilib \
			--disable-shared \
			--disable-threads \
			--disable-target-libiberty \
			--disable-target-zlib \
			--disable-nls \
			--disable-tls \
			$(TARG_XTRA_OPTS) 2>&1 | tee -a $(LOGFILE); \
		$(call log_make,$(IOP_MAKE_TARGET_GCC_STAGE1),$$TARGET); \
		$(MAKE) $(BUILD_QUIET) -j $(NUM_JOBS) all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(BUILD_QUIET) -j $(NUM_JOBS) install-strip 2>&1 | tee -a $(LOGFILE); \
	done

$(EE_MAKE_TARGET_GCC_STAGE1):
	@$(call stage,"$(EE_DIR_TARGET_GCC_STAGE1)")
	@for TARGET in $(EE_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(EE_DIR_TARGET_GCC_STAGE1)"; \
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

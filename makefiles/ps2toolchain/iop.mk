TARGET_PS2TOOLCHAIN_IOP=iop

IOP_BINTUILS_TARGETS += "mipsel-ps2-irx"
IOP_BINTUILS_TARGETS += "mipsel-ps2-elf"

IOP_DEPS += .depends
IOP_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_IOP)-binutils
IOP_DEPS += .ps2toolchain-$(TARGET_PS2TOOLCHAIN_IOP)-gcc-stage1

.ps2toolchain-$(TARGET_PS2TOOLCHAIN_IOP)-binutils:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_IOP)/binutils")
	@for TARGET in $(IOP_BINTUILS_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_IOP)/binutils"; \
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
			$(TARG_XTRA_OPTS); \
		$(MAKE) --quiet -j $(NUM_JOBS); \
		$(MAKE) --quiet -j $(NUM_JOBS) install-strip; \
	done

.ps2toolchain-$(TARGET_PS2TOOLCHAIN_IOP)-gcc-stage1:
	@$(call stage,"$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_IOP)/gcc-stage1")
	@for TARGET in $(IOP_BINTUILS_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(PS2TOOLCHAIN_FOLDER)/$(TARGET_PS2TOOLCHAIN_IOP)/gcc-stage1"; \
		rm -rf "build-$$TARGET-stage1"; \
		mkdir "build-$$TARGET-stage1"; \
		cd "build-$$TARGET-stage1"; \
		../configure \
			--quiet \
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
			$(TARG_XTRA_OPTS); \
		$(MAKE) --quiet -j $(NUM_JOBS) all; \
		$(MAKE) --quiet -j $(NUM_JOBS) install-strip; \
	done

ps2toolchain-$(TARGET_PS2TOOLCHAIN_IOP): $(IOP_DEPS)


am_build_targets += ps2toolchain-$(TARGET_PS2TOOLCHAIN_IOP)

PS2TOOLCHAIN_TARGETS += ps2toolchain-$(TARGET_PS2TOOLCHAIN_IOP)

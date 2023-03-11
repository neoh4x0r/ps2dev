PS2TOOLCHAIN_FOLDER=ps2toolchain

export am_dvp_binutils_cflags="$(CFLAGS)"
ifeq ($(OSVER),MINGW64_NT)
	export lt_cv_sys_max_cmd_len=8000
	am_CC=x86_64-w64-mingw32-gcc
	export TARG_XTRA_OPTS="--host=x86_64-w64-mingw32"
	export am_dvp_binutils_cflags="$(CFLAGS) -DHAVE_DECL_ASPRINTF -DHAVE_DECL_VASPRINTF"
	export CC=$(am_CC)
endif

ifeq ($(OSVER),MINGW32_NT)
	export lt_cv_sys_max_cmd_len=8000
	am_CC=i686-w64-mingw32-gcc
	export TARG_XTRA_OPTS="--host=i686-w64-mingw32"
	export am_dvp_binutils_cflags="$(CFLAGS) -DHAVE_DECL_ASPRINTF -DHAVE_DECL_VASPRINTF"
	export CC=$(am_CC)
endif


include makefiles/ps2toolchain/dvp.mk
include makefiles/ps2toolchain/iop.mk
include makefiles/ps2toolchain/ee.mk

am_build_targets += $(am_ps2toolchain_targets)

ps2toolchain: $(am_ps2toolchain_targets)

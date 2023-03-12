PS2TOOLCHAIN=ps2toolchain

# PS2TOOLCHAIN_HIDE_COMPILER_TARGETS: set to '.' to hide the compiler targets
# For example, to hide ps2toolchain-dvp
PS2TOOLCHAIN_HIDE_COMPILER_TARGETS =

# PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS: set to '.' to hide sub-compiler targets
# For example, to hide ps2toolchain-dvp-binutils
PS2TOOLCHAIN_HIDE_SUBCOMPILER_TARGETS =

# note: am_dvp_binutils_cflags is only used when building dvp-binutils
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

include makefiles/$(PS2TOOLCHAIN)/dvp/includes.mk
include makefiles/$(PS2TOOLCHAIN)/iop/includes.mk
include makefiles/$(PS2TOOLCHAIN)/ee/includes.mk

am_build_targets += $(am_$(PS2TOOLCHAIN)_targets)

$(PS2TOOLCHAIN): $(am_$(PS2TOOLCHAIN)_targets)

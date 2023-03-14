EXTRAS=extras

# EXTRAS_HIDE_TARGETS: set to '.' to hide the compiler targets
# For example, to hide ps2toolchain-dvp
EXTRAS_HIDE_TARGETS = .

include makefiles/$(EXTRAS)/ps2-packer/includes.mk
include makefiles/$(EXTRAS)/ps2client/includes.mk
include makefiles/$(EXTRAS)/ps2link/includes.mk

am_build_targets += $(am_$(EXTRAS)_targets)

$(EXTRAS): $(am_$(EXTRAS)_targets)

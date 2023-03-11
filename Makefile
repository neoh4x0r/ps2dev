AM_BUILD_TARGETS =

include makefiles/includes.mk

all: $(AM_BUILD_TARGETS)

include makefiles/common_targets.mk

.PHONY: $(AM_BUILD_TARGETS)

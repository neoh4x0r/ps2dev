SHELL=bash

all:
	@for target in $(am_build_targets); do \
		$(MAKE) $$target || exit 1 ; \
	done

.PHONY: $(am_build_targets)

include makefiles/includes.mk
include makefiles/common_targets.mk

TARGET_GSKIT=gskit

GSKIT_MAKE_PATH = $(TARGET_GSKIT)

################
## the for loop (for unused in ...) is done so that
## commands progress from one line to the next.
## Eg. commands following 'cd dir' will operate from
## within the context of 'dir'; outside of the for
## the loop a 'cd dir' will have no effect on the
## commands that follow it.
################
$(TARGET_GSKIT):
	@$(call stage,"$(GSKIT_MAKE_PATH)")
	@for unused in "none"; do \
		cd "$(BUILD_FOLDER)/$(GSKIT_MAKE_PATH)"; \
		$(call log_make,$(GSKIT_MAKE_PATH),""); \
		$(MAKE) $(BUILD_QUIET) -j $(SINGLE_JOB) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(BUILD_QUIET) -j $(SINGLE_JOB) install 2>&1 | tee -a $(LOGFILE); \
	done

am_build_targets += $(TARGET_GSKIT)

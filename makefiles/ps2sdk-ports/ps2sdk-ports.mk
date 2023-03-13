TARGET_PS2SDK_PORTS=ps2sdk-ports

PS2SDK_PORTS_MAKE_PATH = $(TARGET_PS2SDK_PORTS)

################
## the for loop (for unused in ...) is done so that
## commands progress from one line to the next.
## Eg. commands following 'cd dir' will operate from
## within the context of 'dir'; outside of the for
## the loop a 'cd dir' will have no effect on the
## commands that follow it.
################
$(TARGET_PS2SDK_PORTS):
	@$(call stage,"$(PS2SDK_PORTS_MAKE_PATH)")
	@for unused in "none"; do \
		cd "$(BUILD_FOLDER)/$(PS2SDK_PORTS_MAKE_PATH)"; \
		$(call log_make,$(PS2SDK_PORTS_MAKE_PATH),""); \
		$(MAKE) $(BUILD_QUIET) -j $(NUM_JOBS) 2>&1 | tee -a $(LOGFILE); \
	done

am_build_targets += $(TARGET_PS2SDK_PORTS)

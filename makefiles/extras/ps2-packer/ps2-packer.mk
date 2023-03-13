TARGET_EXTRA_PS2PACKER=ps2-packer

PS2PACKER_MAKE_PATH = $(EXTRAS)/$(TARGET_EXTRA_PS2PACKER)

$(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2PACKER):
	@$(call stage,"$(PS2PACKER_MAKE_PATH)")
	@for unused in "none"; do \
		cd "$(BUILD_FOLDER)/$(PS2PACKER_MAKE_PATH)"; \
		$(call log_make,$(PS2PACKER_MAKE_PATH),""); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" install 2>&1 | tee -a $(LOGFILE); \
	done

am_$(EXTRAS)_targets += $(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2PACKER)

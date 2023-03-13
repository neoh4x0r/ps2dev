TARGET_EXTRA_PS2LINK=ps2link

PS2LINK_MAKE_PATH = $(EXTRAS)/$(TARGET_EXTRA_PS2LINK)

$(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2LINK):
	@$(call stage,"$(PS2LINK_MAKE_PATH)")
	@for unused in "none"; do \
		cd "$(BUILD_FOLDER)/$(PS2LINK_MAKE_PATH)"; \
		$(call log_make,$(PS2LINK_MAKE_PATH),""); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" install 2>&1 | tee -a $(LOGFILE); \
	done

am_$(EXTRAS)_targets += $(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2LINK)

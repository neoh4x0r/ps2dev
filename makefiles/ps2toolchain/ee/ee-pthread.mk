$(EE_MAKE_TARGET_PTHREAD):
	@$(call stage,"$(EE_DIR_TARGET_PTHREAD)")
	@for TARGET in $(EE_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(EE_DIR_TARGET_PTHREAD)/platform/ps2"; \
		$(call log_make,$(EE_MAKE_TARGET_PTHREAD),$$TARGET); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(BUILD_QUIET) -j "$(NUM_JOBS)" install 2>&1 | tee -a $(LOGFILE); \
	done

$(EE_MAKE_TARGET_PTHREAD):
	@$(call stage,"$(EE_DIR_TARGET_PTHREAD)")
	@for TARGET in $(EE_COMPILE_TARGETS); do \
		cd "$(BUILD_FOLDER)/$(EE_DIR_TARGET_PTHREAD)/platform/ps2"; \
		$(MAKE) --quiet -j "$(NUM_JOBS)" all 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) --quiet -j "$(NUM_JOBS)" install 2>&1 | tee -a $(LOGFILE); \
	done

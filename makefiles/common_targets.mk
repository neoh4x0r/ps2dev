
# clean: clean only the build folder
clean:
	@echo "[CLEANING: $(BUILD_FOLDER)]"
	@rm -rf "$(BUILD_FOLDER)"

# dist-clean: reset checkout and synchronize submodules
dist-clean:
	@echo "[RESETTING submodules]"
	@$(call ResetCheckout)
	@echo "[SYNCING/UPDATING submodules]"
	@$(call PrepareExternals)

# clean $(PS2DEV) folder
clean-ps2dev:
	@echo "[CLEANING: $(PS2DEV)]"
	@rm -rf "$(PS2DEV)"

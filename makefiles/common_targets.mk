
# clean: clean only the build folder
clean:
	@rm -rf "$(BUILD_FOLDER)"

# reset checkout and synchronize submodules
dist-clean:
	@$(call ResetCheckout)
	@$(call PrepareExternals)

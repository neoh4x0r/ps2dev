
# clean: clean only the build folder
clean:
	@rm -rf "$(BUILD_FOLDER)"

dist-clean:
	@$(call ResetCheckout)
	@$(call PrepareExternals)

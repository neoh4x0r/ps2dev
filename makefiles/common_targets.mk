
# clean: clean only the build folder
clean:
	@rm -rf $(BUILD_FOLDER) 2>&1 | tee -a $(LOGFILE)


define stage
	@mkdir -p "$(BUILD_FOLDER)/$1/"
	@echo "[STAGING: $1]" 2>&1 | tee -a $(LOGFILE)
	@cp -rfu "$(EXTERNALS_FOLDER)/$1/"* "$(BUILD_FOLDER)/$1/"
endef

define ResetCheckout
	@echo $(GIT) reset --hard origin/$(GIT_BRANCH)
	@echo $(GIT) clean -fd
endef

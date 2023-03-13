
define stage
	@mkdir -p "$(BUILD_FOLDER)/$1/"
	@echo "[STAGING: $1]" 2>&1 | tee -a $(LOGFILE)
	@cp -rfu "$(EXTERNALS_FOLDER)/$1/"* "$(BUILD_FOLDER)/$1/"
endef

define log_configure
	echo "[CONFIGURING: $1 for $2]" 2>&1 | tee -a $(LOGFILE)
endef

define log_make
	echo "[MAKING: $1 for $2]" 2>&1 | tee -a $(LOGFILE)
endef

define PrepareExternals
	$(GIT) submodule sync
	$(GIT) submodule update --init --recursive
endef

define ResetCheckout
	@$(GIT) reset --hard origin/$(GIT_BRANCH)
	@$(GIT) clean -fd
endef

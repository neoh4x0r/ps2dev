
define stage
	@mkdir -p "$(BUILD_FOLDER)/$1/"
	@cp -rfu "$(EXTERNALS_FOLDER)/$1/"* "$(BUILD_FOLDER)/$1/"
endef

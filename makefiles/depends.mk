DEPEND_SCRIPTS += "check-gcc.sh"
DEPEND_SCRIPTS += "check-git.sh"
DEPEND_SCRIPTS += "check-make.sh"
DEPEND_SCRIPTS += "check-patch.sh"
DEPEND_SCRIPTS += "check-ps2dev.sh"

# execute depend scripts
.depends:
	@for script in $(DEPEND_SCRIPTS); do \
		$(DEPENDS_PATH)/$$script || exit 1 ; \
	done

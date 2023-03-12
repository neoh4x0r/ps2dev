DEPEND_SCRIPTS += "check-gcc.sh"
DEPEND_SCRIPTS += "check-git.sh"
DEPEND_SCRIPTS += "check-make.sh"
DEPEND_SCRIPTS += "check-patch.sh"
DEPEND_SCRIPTS += "check-ps2dev.sh"
DEPEND_SCRIPTS += "check-wget.sh"

# execute depend scripts
.depends:
	@for script in $(DEPEND_SCRIPTS); do \
		$(DEPEND_SCRIPT_PATH)/$$script 2>&1 | tee -a $(LOGFILE) || exit 1 ; \
	done

TARGET_EXTRA_MYMC=mymc

$(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_MYMC):
	@echo "$@ not implemented" 2>&1 | tee -a $(LOGFILE)

am_$(EXTRAS)_targets += $(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_MYMC)

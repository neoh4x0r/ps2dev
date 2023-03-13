TARGET_EXTRA_PS2CLIENT=ps2client

$(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2CLIENT):
	@echo "$@ not implemented" 2>&1 | tee -a $(LOGFILE)

am_$(EXTRAS)_targets += $(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2CLIENT)

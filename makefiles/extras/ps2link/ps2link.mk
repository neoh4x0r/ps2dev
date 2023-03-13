TARGET_EXTRA_PS2LINK=ps2link

$(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2LINK):
	@echo "$@ not implemented" 2>&1 | tee -a $(LOGFILE)

am_$(EXTRAS)_targets += $(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2LINK)

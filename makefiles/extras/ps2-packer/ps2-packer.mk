TARGET_EXTRA_PS2PACKER=ps2-packer

$(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2PACKER):
	@echo "$@ not implemented" 2>&1 | tee -a $(LOGFILE)

am_$(EXTRAS)_targets += $(EXTRAS_HIDE_TARGETS)extra-$(TARGET_EXTRA_PS2PACKER)

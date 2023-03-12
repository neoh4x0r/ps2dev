TARGET_PS2SDK=ps2sdk
$(TARGET_PS2SDK):
	@echo "$@ not implemented" 2>&1 | tee -a $(LOGFILE)

am_build_targets += $(TARGET_PS2SDK)

TARGET_PS2CLIENT=ps2client
$(TARGET_PS2CLIENT):
	@echo "$@ not implemented" 2>&1 | tee -a $(LOGFILE)

am_build_targets += $(TARGET_PS2CLIENT)

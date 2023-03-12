TARGET_PS2SDK_PORTS=ps2sdk-ports
$(TARGET_PS2SDK_PORTS):
	@echo "$@ not implemented" 2>&1 | tee -a $(LOGFILE)

am_build_targets += $(TARGET_PS2SDK_PORTS)

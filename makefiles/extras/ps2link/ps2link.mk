TARGET_EXTRA_PS2LINK=ps2link

PS2LINK_MAKE_PATH = $(EXTRAS)/$(TARGET_EXTRA_PS2LINK)

PS2LINK_TARGET_FILES += bin/IPCONFIG.DAT
PS2LINK_TARGET_FILES += bin/PS2LINK.ELF
PS2LINK_TARGET_FILES += iop/ps2link.irx
PS2LINK_TARGET_FILES += contrib/icon.sys
PS2LINK_TARGET_FILES += contrib/PS2LINK.icn

PS2LINK_SDK_IRX_FILES += ioptrap.irx
PS2LINK_SDK_IRX_FILES += netman.irx
PS2LINK_SDK_IRX_FILES += poweroff.irx
PS2LINK_SDK_IRX_FILES += ps2dev9.irx 
PS2LINK_SDK_IRX_FILES += ps2ip-nm.irx
PS2LINK_SDK_IRX_FILES += smap.irx
PS2LINK_SDK_IRX_FILES += udptty.irx

TARGET_DIR := $(PS2DEV)/bin/$(TARGET_EXTRA_PS2LINK)

$(EXTRAS_HIDE_TARGETS)$(TARGET_EXTRA_PS2LINK):
	@$(call stage,"$(PS2LINK_MAKE_PATH)")
	@for unused in "none"; do \
		cd "$(BUILD_FOLDER)/$(PS2LINK_MAKE_PATH)"; \
		$(call log_make,$(PS2LINK_MAKE_PATH),""); \
		$(MAKE) $(BUILD_QUIET) -j "$(SINGLE_JOB)" clean all 2>&1 | tee -a $(LOGFILE); \
		mkdir -p "$(TARGET_DIR)"; \
		for file in $(PS2LINK_TARGET_FILES); do \
			cp -f "$(BUILD_FOLDER)/$(PS2LINK_MAKE_PATH)/$$file" "$(TARGET_DIR)" 2>&1 | tee -a $(LOGFILE); \
		done; \
		for file in $(PS2LINK_SDK_IRX_FILES); do \
			ln -sf "$(PS2SDK)/iop/irx/$$file" "$(TARGET_DIR)" 2>&1 | tee -a $(LOGFILE); \
		done; \
	done

am_$(EXTRAS)_targets += $(EXTRAS_HIDE_TARGETS)$(TARGET_EXTRA_PS2LINK)

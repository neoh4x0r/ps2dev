TARGET_PS2SDK=ps2sdk

PS2SDK_MAKE_PATH = $(TARGET_PS2SDK)

################
## the for loop (for unused in ...) is done so that
## commands progress from one line to the next.
## Eg. commands following 'cd dir' will operate from
## within the context of 'dir'; outside of the for
## the loop a 'cd dir' will have no effect on the
## commands that follow it.
################
$(TARGET_PS2SDK):
	@$(call stage,"$(PS2SDK_MAKE_PATH)")
	@for unused in "none"; do \
		cd "$(BUILD_FOLDER)/$(PS2SDK_MAKE_PATH)"; \
		$(call log_make,$(PS2SDK_MAKE_PATH),""); \
		$(MAKE) $(BUILD_QUIET) -j $(SINGLE_JOB) 2>&1 | tee -a $(LOGFILE); \
		$(MAKE) $(BUILD_QUIET) -j $(SINGLE_JOB) install 2>&1 | tee -a $(LOGFILE); \
		ln -sf "$(PS2SDK)/ee/lib/libcglue.a" "$(PS2DEV)/ee/mips64r5900el-ps2-elf/lib/libcglue.a"; \
		ln -sf "$(PS2SDK)/ee/lib/libpthreadglue.a" "$(PS2DEV)/ee/mips64r5900el-ps2-elf/lib/libpthreadglue.a"; \
		ln -sf "$(PS2SDK)/ee/lib/libkernel.a"  "$(PS2DEV)/ee/mips64r5900el-ps2-elf/lib/libkernel.a"; \
		ln -sf "$(PS2SDK)/ee/lib/libcdvd.a"  "$(PS2DEV)/ee/mips64r5900el-ps2-elf/lib/libcdvd.a"; \
	done

am_build_targets += $(TARGET_PS2SDK)

####################################
# Set the install path here
####################################
INSTALL_PREFIX=$(HOME)
#INSTALL_PREFIX=/usr/local
####################################

export PS2DEV := $(INSTALL_PREFIX)/ps2dev
export PS2SDK := $(PS2DEV)/ps2sdk

PS2DEV_PATH := $(PATH)
PS2DEV_PATH := $(PS2DEV_PATH):$(PS2DEV)/bin/
PS2DEV_PATH := $(PS2DEV_PATH):$(PS2DEV)/ee/bin/
PS2DEV_PATH := $(PS2DEV_PATH):$(PS2DEV)/iop/bin/
PS2DEV_PATH := $(PS2DEV_PATH):$(PS2DEV)/dvp/bin/
PS2DEV_PATH := $(PS2DEV_PATH):$(PS2SDK)/bin/

export PATH := $(PS2DEV_PATH)


# ROOT_DIR: the root source directory
ROOT_DIR=$(shell readlink -f ".")

# BUILD_FOLDER: path to the build directory
BUILD_FOLDER=$(ROOT_DIR)/build

# EXTERNALS_FOLDER: path to the externals directory
EXTERNALS_FOLDER=$(ROOT_DIR)/externals

DEPEND_SCRIPT_PATH=$(ROOT_DIR)/depends

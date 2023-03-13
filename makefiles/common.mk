
# NUM_JOBS: number of parallel make jobs
# -- set this to 1 for debugging
NUM_JOBS=$(shell nproc)
SINGLE_JOB=1

# get substring of os version (grad first 10 characters)
OSVER=$(shell uname | cut -c 1-10)

LOGFILE=$(BUILD_FOLDER)/build.log

GIT_BRANCH=$(shell $(GIT) rev-parse --abbrev-ref HEAD)

# BUILD_QUIET: uncomment and set to --quiet so it is passed to 'make/configure' commands
BUILD_QUIET := --quiet

ifneq ($(VERBOSE),)
# turn off BUILD_QUIET if VERBOSE is non-empty
BUILD_QUIET=
# export VERBOSE (and set to 1)
export VERBOSE=1
endif



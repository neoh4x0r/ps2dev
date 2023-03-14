
# SINGLE_JOB: run only 1 make job
SINGLE_JOB=1

# MAX_JOBS: set the max number of of make jobs to the number of cpu-cores
MAX_JOBS=$(shell nproc)


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



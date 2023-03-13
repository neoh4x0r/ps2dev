
# NUM_JOBS: number of parallel make jobs
# -- set this to 1 for debugging
NUM_JOBS=$(shell nproc)

# get substring of os version (grad first 10 characters)
OSVER=$(shell uname | cut -c 1-10)

LOGFILE=$(BUILD_FOLDER)/build.log

GIT_BRANCH=$(shell $(GIT) rev-parse --abbrev-ref HEAD)

# MAKE_QUIET: uncomment and set to --quiet to  have 'make' commands be quiet
#MAKE_QUIET := --quiet

# CONFIGURE_QUIET: uncomment and set to --quiet to have 'configure' commands be quiet
#CONFIGURE_QUIET := --quiet

#!/usr/bin/env bash

# Conf example :
#
# export TEST_MOUNTPOINT="/home/svfs" (without slash at the end)
# export TEST_CONTAINER="default" (container must be created before)
# export TEST_SEG_SIZE="5" (in MB)
# export TEST_NSEG_SIZE="5" (in MB)
#

export TEST_MOUNTPOINT=""
export TEST_CONTAINER=""
export TEST_SEG_SIZE=""
export TEST_NSEG_SIZE=""

rake test

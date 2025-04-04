#!/bin/bash

# Create the final MicroRTS.jar by running MicroRTS-build.sh && MicroRTS-clean.sh as a single command

# Project Root folder
export ROOT=$PROJECTS/Active/Dissertation_Thesis/Code/MicroRTS

# Delete the existing build folder and all it's content
rm -rf $ROOT/build

# Make MicroRTS.jar
$ROOT/scripts/MicroRTS-build.sh && $ROOT/scripts/MicroRTS-clean.sh

#!/bin/bash
# Run MicroRTS game

# The root folder of MicroRTS project
export ROOT=$PROJECTS/Active/Dissertation_Thesis/Code/MicroRTS
cd $ROOT/build
java -cp ./MicroRTS.jar rts.MicroRTS "$@"

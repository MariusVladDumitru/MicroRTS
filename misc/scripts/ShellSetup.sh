#!/bin/bash
# Setup for .sh scripts
# to call this script use the source command - source ShellSetup.sh

# project's root path
# $PROJECTS - needs to be set before
if [[ -v PROJECTS ]]; then
    echo "PROJECTS environment variable is set, ALL OK"
else
    echo "PROJECTS IS NOT SET, PLEASE SET PROJECTS ENVIRONMENT VARIABLE"
	exit
fi

# $PROJECTS include the Active folder.
# $PROJECTS is D:\Projects\Active

export ROOT=$PROJECTS/Dissertation_Thesis/Code/MicroRTS

# code
export CODE=$ROOT/code

# game code
export GAME=$CODE/game

# scripts
export SCRIPTS=$CODE/scripts

# bin
export BIN=$ROOT/bin

# libs
export LIBS=$BIN/lib

# build
export BUILD=$BIN/build

# flag to announce that shell setup is ok!
export SETUP_DONE=1
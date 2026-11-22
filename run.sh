#!/bin/bash
# Run MicroRTS game

# MicroRTS.jar
MICRORTS_JAR=~/Builds/MicroRTS/game/MicroRTS.jar

# Run the game
java -cp $MICRORTS_JAR rts.MicroRTS "$@"

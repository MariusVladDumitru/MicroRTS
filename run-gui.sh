#!/bin/bash
# Run MicroRTS game gui

# MicroRTS.jar
MICRORTS_JAR=~/Builds/MicroRTS/game/MicroRTS.jar

# Run the GUI
java -cp $MICRORTS_JAR gui.frontend.FrontEnd "$@"

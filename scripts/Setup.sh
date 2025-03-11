# Prepares the shell for working with MicroRTS. Requirements: bash, Java JDK.
# MicroRTS needs Java JDK to exist on your system(either you install it or you get it from an archive). You can download Java JDK at https://www.oracle.com/java/technologies/downloads/
# Exports the environment variables JAVA_HOME, JAVA_BIN, JAVA_SERVER and adds them to the current path. Only modify the JAVA_HOME variable to your own path.
# The environment variables export here are not global, only local to your current running shell (terminal), they will dissapear when you close your current running shell(terminal).
# Run this script only once when you start up your terminal.
# If you close and reopen your terminal, run this script again.

@echo off

# Path where JAVA JDK is Installed. MODIFY HERE.
export JAVA_HOME=

# Do not modify
export JAVA_BIN=$JAVA_HOME/bin

# Do not modify. I don't know precisely why i need this, but i get errors if this does not exist.
export JAVA_SERVER=$JAVA_BIN/server

# Add to existing path
export PATH=$PATH:$JAVA_BIN:$JAVA_SERVER

# This is a flag to communicate that this script has been executed.
export RUN_SETUP=true

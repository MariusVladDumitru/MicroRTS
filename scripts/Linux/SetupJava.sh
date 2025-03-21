#!/bin/bash
# If you downloaded java manually from https://www.oracle.com/java/technologies/downloads, then this script makes some needed setup

# if you downloaded java using your distribution's package manager, then java is already ready to go.

# Path where JAVA JDK is Installed. MODIFY HERE
export JAVA_HOME=<JAVA_ABSOLUTE_PATH_HERE>

# Do not modify
export JAVA_BIN=$JAVA_HOME\bin

# Do not modify. I don't know precisely why i n
eed this, but i get errors if this does not exist.
export JAVA_SERVER=$JAVA_BIN\server

# Add to existing path
export PATH=$PATH:$JAVA_BIN:$JAVA_SERVER

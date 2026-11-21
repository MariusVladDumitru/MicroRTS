#!/bin/bash
# Create the final MicroRTS.jar by running MicroRTS-build.sh && MicroRTS-clean.sh as a single command

if [[ "${SETUP_DONE:-0}" -ne 1 ]]; then
  echo 'Please run the ShellSetup.sh script with the source command'
  exit
fi

# Delete the existing build folder and all it's content
rm -rf $BUILD

# Make MicroRTS.jar
$SCRIPTS/MicroRTS-build.sh && $SCRIPTS/MicroRTS-clean.sh

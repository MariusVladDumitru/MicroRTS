#!/bin/bash
# Run MicroRTS game

if [[ "${SETUP_DONE:-0}" -ne 1 ]]; then
  echo 'Please run the ShellSetup.sh script with the source command'
  exit
fi

# The root folder of MicroRTS project
pushd .
cd $BUILD
java -cp ./MicroRTS.jar rts.MicroRTS "$@"
popd

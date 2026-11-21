#!/bin/bash
# Run MicroRTS game gui

if [[ "${SETUP_DONE:-0}" -ne 1 ]]; then
  echo 'Please run the ShellSetup.sh script with the source command'
  exit
fi

pushd .
cd $BUILD
java -cp ./MicroRTS.jar gui.frontend.FrontEnd "$@"
popd

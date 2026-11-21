#!/bin/bash
# Run MicroRTS game

if [[ "${SETUP_DONE:-0}" -ne 1 ]]; then
  echo 'Please run the ShellSetup.sh script with the source command'
  exit
fi

pushd .
cd $BUILD
shopt -s extglob
rm -rf !(MicroRTS.jar)
popd


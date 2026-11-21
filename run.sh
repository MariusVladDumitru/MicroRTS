#!/bin/bash
# Run MicroRTS game

# The root folder of MicroRTS project
pushd .
cd bin 
if [ $? -ne 0 ]; then
    echo "There is no bin folder. You need to be in the root folder of the MicroRTS project"
	exit 1
fi

java -cp ./MicroRTS.jar rts.MicroRTS "$@"
popd

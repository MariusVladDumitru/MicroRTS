#!/bin/bash
# Builds the MicroRTS game in build folder

if [[ "${SETUP_DONE:-0}" -ne 1 ]]; then
  echo 'Please run the ShellSetup.sh script with the source command'
  exit
fi

# make the build folder - may not exist, will error out if it exist
pushd .
mkdir $BUILD
cd $BUILD

# compile source files from $ROOT/src folder
javac -cp "$LIBS/*:$GAME" -d . -Xlint:all -Xmaxwarns 10000 -Xmaxerrs 10000  $(find $GAME -name "*.java") # compile source files

# extract the contents of all the .jar files from $ROOT/lib into $ROOT/build
find $LIBS -name "*.jar" | xargs -n 1 jar xvf # extract the contents of the JAR dependencies

# build the final MicroRTS.jar file by combining all .class files resulted from comiling .java files from $GAME and extracted from $LIBS folder
jar cvf MicroRTS.jar $(find . -name '*.class' -type f) # create a single JAR file with sources and dependencies

popd
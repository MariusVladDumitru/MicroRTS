#!/bin/bash
# Builds the MicroRTS game in build folder

# The root folder of MicroRTS project
export ROOT=$PROJECTS/Active/Dissertation_Thesis/Code/MicroRTS
cd $ROOT/build
javac -cp "../lib/*:../src" -d . -Xlint:all -Xmaxwarns 10000 -Xmaxerrs 10000  $(find ../src -name "*.java") # compile source files
find ../lib -name "*.jar" | xargs -n 1 jar xvf # extract the contents of the JAR dependencies
jar cvf MicroRTS.jar $(find . -name '*.class' -type f) # create a single JAR file with sources and dependencies

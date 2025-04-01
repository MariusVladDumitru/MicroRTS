#!/bin/bash
# Builds the MicroRTS game in build folder

# The root folder of MicroRTS project
export ROOT=$PROJECTS/Active/Dissertation_Thesis/Code/MicroRTS

# make the build folder - may not exist, will error out if it exist
mkdir $ROOT/build

#cd to build folder
cd $ROOT/build

# compile source files from $ROOT/src folder
javac -cp "../lib/*:../src" -d . -Xlint:all -Xmaxwarns 10000 -Xmaxerrs 10000  $(find ../src -name "*.java") # compile source files

# extract the contents of all the .jar files from $ROOT/lib into $ROOT/build
find ../lib -name "*.jar" | xargs -n 1 jar xvf # extract the contents of the JAR dependencies

# build the final MicroRTS.jar file by combining all .class files resulted from comiling .java files from $ROOT/src and extracted from $ROOT/lib folder
jar cvf MicroRTS.jar $(find . -name '*.class' -type f) # create a single JAR file with sources and dependencies

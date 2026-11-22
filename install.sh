#!/bin/bash

# Build the final MicroRTS.jar file
# Installs it to a known location

# needed directories
# Repo dirs
REPO_DIR=~/Projects/MicroRTS
REPO_DATA_DIR=$REPO_DIR/data
REPO_BIN_DIR=$REPO_DIR/bin 
REPO_BIN_TMP_DIR=$REPO_BIN_DIR/tmp

# Build directories
BUILD_DIR=~/Builds/MicroRTS
BUILD_GAME_DIR=$BUILD_DIR/game

# Build the final .jar file
build_jar() {
	if [ ! -d $REPO_BIN_TMP_DIR ]; then
		echo -e "\nRunning command: mkdir -m 700 $REPO_BIN_TMP_DIR\n"
		mkdir -m 700 $REPO_BIN_TMP_DIR
	fi

	# i need to be in the root folder
	pushd .

	# cd to $REPO_BIN_TMP_DIR
	echo -e "\nRunning command: cd $REPO_BIN_TMP_DIR\n"
	cd $REPO_BIN_TMP_DIR
	if [ $? -ne 0 ]; then
		echo -e "\nFor some misterious reason i cannot cd to $REPO_BIN_TMP_DIR. Exiting.\n"
		exit 1
	fi

	# Remove the old bin/build.log
	rm ../build.log

	# Create an empty bin/build.log
	touch ../build.log

	echo -e "[Compiling source files from code/game]\n" >> ../build.log
	# compile source files from code/game folder
	javac -cp "../lib/*:../../code/game" -d . -Xlint:all -Xmaxwarns 10000 -Xmaxerrs 10000  $(find ../../code/game -name "*.java") >> ../build.log 2>> ../build.log # compile source files
	echo -e "\n" >> ../build.log

	# Extract contents of the bin/lib files(.jar files) in bin/tmp
	echo -e "\n[Extract the contents of all the .jar files from bin/lib into bin/tmp]\n" >> ../build.log
	find ../lib -name "*.jar" | xargs -n 1 jar xvf >> ../build.log 2>> ../build.log # extract the contents of the JAR dependencies
	echo -e '\n' >> ../build.log

	# Build the final MicroRTS.jar file
	echo -e "\n[Build the final MicroRTS.jar file by combining all .class files.]\n" >> ../build.log
	# build the final MicroRTS.jar file by combining all .class files resulted from comiling .java files from code/game and extracted from bin/libs folder
	jar cvf MicroRTS.jar $(find . -name '*.class' -type f) >> ../build.log 2>> ../build.log # create a single JAR file with sources and dependencies
	echo -e '\n' >> ../build.log

	# Move MicroRTS.jar outside of tmp
	# It should be in bin/MicroRTS.jar aka $REPO_BIN_DIR/MicroRTS.jar
	echo "Running: mv MicroRTS.jar $REPO_BIN_DIR/"
	mv MicroRTS.jar $REPO_BIN_DIR/

	# clean $REPO_BIN_TMP_DIR folder
	rm -r ./*

	# go back to where i was
	popd
}

# Create $BUILD_DIF if needed
if [ ! -d $BUILD_DIR ]; then
	echo -e "\nRunning mkdir -m 700 -p $BUILD_DIR\n"
	mkdir -m 700 -p $BUILD_DIR
fi

# remove the old $BUILD_GAME_DIR
# remove the old version of the game
echo -e "\nRunning: rm -r $BUILD_GAME_DIR\n"
rm -r $BUILD_GAME_DIR

# Create the new folders
# Create $BUILD_GAME_DIR
echo -e "\nRunning command: mkdir -m 700 $BUILD_GAME_DIR"
mkdir -m 700 $BUILD_GAME_DIR

# Build MicroRTS.jar
build_jar

# Move MicroRTS.jar to $BUILD_GAME_DIR
echo -e "\nRunning command: mv $REPO_BIN_DIR/MicroRTS.jar $BUILD_GAME_DIR/\n"
mv $REPO_BIN_DIR/MicroRTS.jar $BUILD_GAME_DIR/

# Copy the data folder to $BUILD_GAME_DIR
echo -e "\nRunning command: cp -a $REPO_DATA_DIR/ $BUILD_GAME_DIR/
\n"
cp -a $REPO_DATA_DIR/ $BUILD_GAME_DIR/

echo "Finished."
echo "In $BUILD_GAME_DIR you should have MicroRTS.jar and a data folder."

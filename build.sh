#!/bin/bash
# Builds the MicroRTS game in build folder
# Run this script from the MicroRTS project's root folder.

if [[ ! -d "bin" ]]; then
	echo -e "Directory bin does not exists.\nYou are not in the root folder.\nPlease cd inside the project's root folder."
	exit 1
else if [[ ! -d "bin/tmp" ]]; then
		mkdir bin/tmp
	 fi
fi

# i need to be in the root folder
pushd .

# cd to bin/tmp
cd bin/tmp 
if [ $? -ne 0 ]; then
    echo "For some misterious reason i cannot cd to bin/tmp"
	exit 1
fi

rm ../build.log
touch ../build.log

echo '[Compiling source files from code/game]' >> ../build.log
# compile source files from code/game folder
javac -cp "../lib/*:../../code/game" -d . -Xlint:all -Xmaxwarns 10000 -Xmaxerrs 10000  $(find ../../code/game -name "*.java") >> ../build.log 2>> ../build.log # compile source files
echo -e '\n' >> ../build.log

echo '[Extract the contents of all the .jar files from bin/lib into bin/tmp]' >> ../build.log
# extract the contents of all the .jar files from bin/lib into bin/tmp
find ../lib -name "*.jar" | xargs -n 1 jar xvf >> ../build.log 2>> ../build.log # extract the contents of the JAR dependencies
echo -e '\n' >> ../build.log

echo '[Build the final MicroRTS.jar file by combining all .class files.]' >> ../build.log
# build the final MicroRTS.jar file by combining all .class files resulted from comiling .java files from code/game and extracted from bin/libs folder
jar cvf MicroRTS.jar $(find . -name '*.class' -type f) >> ../build.log 2>> ../build.log # create a single JAR file with sources and dependencies
echo -e '\n' >> ../build.log

# Remove the old MicroRTS version
rm -r ~/Projects/Dissertation-2026/MicroRTS
mkdir ~/Projects/Dissertation-2026/MicroRTS

# Install the new version
mv MicroRTS.jar ~/Projects/Dissertation-2026/MicroRTS
cp -r ../../data ~/Projects/Dissertation-2026/MicroRTS

# clean bin/tmp folder
rm -r ./*

# go back to where i was
popd

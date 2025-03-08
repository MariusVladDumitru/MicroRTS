:: Prepares the shell for working with MicroRTS.
:: MicroRTS needs Java JDK to exist on your system(either you install it or you get it from an archive). You can download Java JDK at https://www.oracle.com/java/technologies/downloads/
:: Sets the environment variables JAVA_HOME, JAVA_BIN, JAVA_SERVER and adds them to the current path. Only modify the JAVA_HOME variable to your own path.
:: The environment variables set here are not global, only local to your current running shell (terminal), they will dissapear when you close your current running shell(terminal).
:: Run this script only once when you start up your terminal.
:: If you close and reopen your terminal, run this script again.

@echo off

:: Path where JAVA JDK is Installed. MODIFY HERE.
set JAVA_HOME=C:\Program Files\Java\jdk-23

:: Do not modify
set JAVA_BIN=%JAVA_HOME%\bin

:: Do not modify. I don't know precisely why i need this, but i get errors if this does not exist.
set JAVA_SERVER=%JAVA_BIN%\server

:: Add to existing path
set PATH=%PATH%;%JAVA_BIN%;%JAVA_SERVER%

:: This is a flag to communicate that this script has been executed.
set RUN_SETUP=true
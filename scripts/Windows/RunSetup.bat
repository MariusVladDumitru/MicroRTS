:: Run this file to setup the environment for MicroRTS
:: This script needs to be run from <PROJECT_ROOT>\scripts\Windows (current directory

:: Don't show nothing on console
@echo off

:: Start and activate the MicroRTS conda environment
call .\StartCondaEnv.bat

:: Run the setup command of MicroRTS.py
python ..\MicroRTS.py setup
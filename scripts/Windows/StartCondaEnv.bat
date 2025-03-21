:: Start the specific conda environment for this MicroRTS. Makes things a little faster to start working.
@echo off

:: Activate Miniconda environment
call .\SetupConda.bat

:: Activate the MicroRTS conda environment.
conda activate MicroRTS

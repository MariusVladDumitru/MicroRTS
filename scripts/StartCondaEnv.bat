:: Start the specific conda environment for this project. Makes it a little faster to start working.

:: Call my own script that activates miniconda. MinicondaSetup must already be in PATH.
call MinicondaSetup.bat

:: Activate the MicroRTS conda environment.
conda activate MicroRTS

#!/bin/bash
# Only use this file if you download JAVA JDK manually.
# If you installed JAVA JDK from your distribution's package manager, then you do not need to use this script.


# Prepares the shell for working with MicroRTS.

# MicroRTS needs Java JDK to exist on your system(either you install it or you get it from an archive). You can download Java JDK at /

# Sets the environment variables JAVA_HOME, JAVA_BIN, JAVA_SERVER and adds them to the current path. Only modify the JAVA_HOME variable to your own path.

# The environment variables set here are not global, only local to your current running shell (terminal), they will dissapear when you close your current running shell(terminal).

# Run this script only once when you start up your terminal.

# If you close and reopen your terminal, run this script again.
#!/bin/bash
# Sets RUN_SETUP environment variable and activates the conda environment MicroRTS

# This is a flag to communicate that this script has been executed.
export RUN_SETUP=True

# activate conda environment
conda init
conda activate MicroRTS

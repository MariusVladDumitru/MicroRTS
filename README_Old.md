# Stuff that may be useful

## Papers
- https://arxiv.org/pdf/2105.13807

## Web pages
- https://wandb.ai/vwxyzjn/gym-microrts-paper/reports/Gym-RTS-Toward-Affordable-Deep-Reinforcement-Learning-Research-in-Real-Time-Strategy-Games--Vmlldzo2MDIzMTg

## Videos
- [https://www.youtube.com/watch?v=jzdodD3mX_o](https://www.youtube.com/watch?v=jzdodD3mX_o)
- [https://www.youtube.com/watch?v=BikqC5gZWhU](https://www.youtube.com/watch?v=BikqC5gZWhU)
- [https://www.youtube.com/watch?v=_jVOMNqw3Qs](https://www.youtube.com/watch?v=_jVOMNqw3Qs)
- [https://www.youtube.com/watch?v=zucvphd5Mg0](https://www.youtube.com/watch?v=zucvphd5Mg0)
- [https://www.youtube.com/watch?v=Or3IZaRRYIQ](https://www.youtube.com/watch?v=Or3IZaRRYIQ)
- [https://www.youtube.com/watch?v=ZsKKAoiD7B0](https://www.youtube.com/watch?v=ZsKKAoiD7B0)

## Git Repos
- [https://github.com/dsaleixo/MicroRTS_Pure_Python](https://github.com/dsaleixo/MicroRTS_Pure_Python)
- [https://github.com/dsaleixo/MicroRTS_DSL_Python](https://github.com/dsaleixo/MicroRTS_DSL_Python)
- [https://github.com/rubensolv/MicroRTS](https://github.com/rubensolv/MicroRTS)
- https://github.com/dsaleixo/MicroRTS_Pure_Python
- [https://github.com/dsaleixo](https://github.com/dsaleixo)
- [https://github.com/vwxyzjn/gym-microrts-paper](https://github.com/vwxyzjn/gym-microrts-paper)
- [https://github.com/kronion/microrts-ppo-comparison](https://github.com/kronion/microrts-ppo-comparison)
- [https://github.com/Coac/coac-ai-microrts](https://github.com/Coac/coac-ai-microrts)
- [https://github.com/jesseearuiz/Fall24_Deep_Learning_MicroRTS](https://github.com/jesseearuiz/Fall24_Deep_Learning_MicroRTS)
- [https://github.com/search?q=MicroRTS&type=repositories](https://github.com/search?q=MicroRTS&type=repositories)


# How to build
Run build.sh from inside the root folder(don't cd into any subfolders.)  
build.sh will: 
- compile a new version of MicroRTS.jar in bin/MicroRTS.jar and move it to ~/Projects/Dissertation-2026/MicroRTS.
- copy the existing ./data folder to ~/Projects/Dissertation-2026/MicroRTS.
Any new updates to MicroRTS.jar and/or ./data will be transfered to ~/Projects/Dissertation-2026/MicroRTS.

# How to use
The installed version is at ~/Projects/Dissertation-2026/MicroRTS.  
~/Projects/Dissertation-2026/MicroRTS:  
- MicroRTS.jar - contains all the .java compiled classes
- data folder - contains all assets.
Only use ~/Projects/Dissertation-2026/MicroRTS.jar.

# Fork
This project is a fork, the original code is available at [https://github.com/Farama-Foundation/MicroRTS](https://github.com/Farama-Foundation/MicroRTS)  
```shell
git clone https://github.com/Farama-Foundation/MicroRTS.git
```

# Tools
- Bash or cmd
- Java JDK
- Python

# Setup
- Install a text editor or IDE of your choice. Recommandations: [Intellij IDEA](https://www.jetbrains.com/idea/), [NetBeans](https://netbeans.apache.org/front/main/index.html), [Visual Studio Code](https://code.visualstudio.com/), [Sublime Text](https://www.sublimetext.com/), [Notepad++](https://notepad-plus-plus.org/), [Kate](https://kate-editor.org/).

- Install Miniconda or Anaconda available [here](https://www.anaconda.com/download/). Documentation: [Conda documentation](https://docs.conda.io/projects/conda/en/latest/index.html), [Getting Started Guide](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html).  

- Create new conda environment: 
```shell
conda create -n MicroRTS
```

- Activate the new environment: 
```shell
conda activate MicroRTS
```

- Install packages from requirements.txt: 
```shell
conda install --yes --file MicroRTS.py_requirements.txt
```
***CHECK IF THIS WORKS - the conda install from requirements command***

- Close the terminal where you typed these commands.

- Install JAVA JDK from [https://www.oracle.com/java/technologies/downloads/](https://www.oracle.com/java/technologies/downloads/). Either use the installer or extract the archive.

- Clone this repository: 
```shell
git clone https://github.com/MariusVladDumitru/MicroRTS.git
```

- cd into MicroRTS/Scripts/Windows  
```shell
cd MicroRTS/scripts/Windows
```
- You need to edit ***SetupEnv.bat*** and ***SetupConda.bat*** (Windows):
    - For ***SetupEnv.bat/SetupEnv.sh***, edit the line ```JAVA_HOME=```, copy-paste the absolute path of the Java JDK you installed previously. ```JAVA_HOME=<ABSOLUTE_PATH_TO_JAVA_JDK>```.

- Run ```RunSetup.bat``` (Windows):
```shell
RunSetup.bat
```

- The RunSetup script will provide a command prompt with all the needed setup done, including activating the MicroRTS conda environment. In this new command prompt you are supposed to interact with the game via MicroRTS.py script, ```MicroRTS.py <command> [<optional_arguments>]```. No need to run ```MicroRTS.py setup```, it has already been done. If you close and reopen the terminal, ```cd``` to ```scripts/Windows``` and execute ```RunSetup.bat``` again.


# Docs from original repo

microRTS is a small implementation of an RTS game, designed to perform AI research. The advantage of using microRTS with respect to using a full-fledged game like Wargus or StarCraft (using BWAPI) is that microRTS is much simpler, and can be used to quickly test theoretical ideas, before moving on to full-fledged RTS games.

By default, microRTS is deterministic and real-time (i.e. players can issue actions simultaneously, and actions are durative). However, it is possible to experiment both with fully-observable and partially-observable games, as well as with deterministic and non-deterministic exporttings via configuration flags. As part of the implementation, I include a collection of hard-coded, and game-tree search techniques (such as variants of minimax, Monte Carlo search, and Monte Carlo Tree Search).

microRTS was developed by [Santiago Ontañón](https://sites.google.com/site/santiagoontanonvillar/Home). 

MicroRTS-Py will eventually be updated, maintained, and made compliant with the standards of the Farama Foundation (https://farama.org/project_standards). However, this is currently a lower priority than other projects we're working to maintain. If you'd like to contribute to development, you can join our discord server here- https://discord.gg/jfERDCSw.

For a video of how microRTS looks like when a human plays, see a [YouTube video](https://www.youtube.com/watch?v=ZsKKAoiD7B0)

If you are interested in testing your algorithms against other people's, **there is an annual microRTS competition**. For more information on the competition see the [competition website](https://sites.google.com/site/micrortsaicompetition/home). The previous competitions have been organized at IEEE-CIG2017 and IEEE-CIG2018, and this year it's organized at IEEE-COG2019 (notice the change of name of the conference).

To cite microRTS, please cite this paper:

Santiago Ontañón (2013) The Combinatorial Multi-Armed Bandit Problem and its Application to Real-Time Strategy Games, In AIIDE 2013. pp. 58 - 64.

## exportting up microRTS in an IDE

Watch [this YouTube video](https://www.youtube.com/watch?v=_jVOMNqw3Qs) to learn how to acquire microRTS and exportup a project using Netbeans.

## Reinforcement Learning in microRTS

If you'd like to use reinforcement learning in microRTS please check this project: https://github.com/Farama-Foundation/MicroRTS-Py

## Executing microRTS through the terminal

If you want to build and run microRTS from source using the command line, clone or download this repository and run the following commands in the root folder of the project to compile the source code:

Linux or Mac OS:

```shell
javac -cp "lib/*:src" -d bin src/rts/MicroRTS.java # to build
```

Windows:

```shell
javac -cp "lib/*;src" -d bin src/rts/MicroRTS.java # to build
```

### Generating a JAR file

You can join all compiled source files and dependencies into a single JAR file, which can be executed on its own. In order to create a JAR file for microRTS:

```shell
javac -cp "lib/*:src" -d bin $(find . -name "*.java") # compile source files
cd bin
find ../lib -name "*.jar" | xargs -n 1 jar xvf # extract the contents of the JAR dependencies
jar cvf microrts.jar $(find . -name '*.class' -type f) # create a single JAR file with sources and dependencies
```

### Executing microRTS

To execute microRTS from compiled class files:

```shell
java -cp "lib/*:bin" rts.MicroRTS # on Linux/Mac
java -cp "lib/*;bin" rts.MicroRTS # on Windows
```

To execute microRTS from the JAR file:

```shell
java -cp microrts.jar rts.MicroRTS
```

#### Which class to execute

microRTS has multiple entry points, and for experimentation purposes you might eventually want to create your own class if none of the base ones suit your needs (see the "tests" folder for examples), but a default one is the `gui.frontend.FrontEnd` class, which opens the default GUI. To execute microRTS in this way, use the following command:

```shell
java -cp microrts.jar gui.frontend.FrontEnd
```

Another, more expansive entry point is the `rts.MicroRTS` class. It is capable of starting microRTS in multiple modes, such as in client mode (attempts to connect to a server which will provide commands to a bot), server mode (tries to connect to a client in order to control a bot), run a standalone game and exit or open the default GUI.

The `rts.MicroRTS` class accepts multiple initialization parameters, either from the command line or from a properties file. A list of all the acceptable command-line arguments can be accessed through the following command:

```shell
java -cp microrts.jar rts.MicroRTS -h
```

An example of a properties file is provided in the `resources` directory. microRTS can be started using a properties file with the following command:

```shell
java -cp microrts.jar rts.MicroRTS -f my_file.properties
```

## Instructions

![instructions image](https://raw.githubusercontent.com/santiontanon/microrts/master/help.png)

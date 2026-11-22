# Gitlab Changes:
- Copied the code + wiki from the original repo located at: [https://github.com/Farama-Foundation/MicroRTS](https://github.com/Farama-Foundation/MicroRTS) and [https://github.com/Farama-Foundation/MicroRTS/wiki](https://github.com/Farama-Foundation/MicroRTS/wiki)
- The original code + wiki where hosted, originally on gitlab.upb.ro, repos are: [https://gitlab.upb.ro/marius_vlad.dumitru/MicroRTS](https://gitlab.upb.ro/marius_vlad.dumitru/MicroRTS) and [https://gitlab.upb.ro/marius_vlad.dumitru/MicroRTS/-/wikis/home](https://gitlab.upb.ro/marius_vlad.dumitru/MicroRTS/-/wikis/home)
- Reorganized folders.
- Added build.sh, run.sh, run-gui.sh to have an idea of how to run the game.
- Added a post-commit git hook that run build.sh when a change is commited.
- At some point all the projects assets(maps, traces, config, bayesianmodels, ahtn) where moved into the data folder. Because of this some hardcoded paths may be broken. You need to check all .java files for these hardcoded paths and fix them.

# 2026-11-21
- Disabled the git hook post commit that automatically builds MicroRTS.jar when adding a new commit. This is temporary, i intend to re-enable it later.
- Replaced build.sh with install.sh. install.sh builds MicroRTS.jar, moves MicroRTS.jar and copies data folder in ~/Builds/MicroRTS/game. So ~/Builds/MicroRTS/game contains MicroRTS.jar and data folder.

# 2026-11-22
- Discovered how to configure IntelliJ IDEA to run and debug classes inside the project
- Re-enabled the post-commit hook. 
- ~/Builds/MicroRTS is the working directory for the project. The path will store the MicroRTS.jar, it's data folder and all the new files and folders the project creates.
- VERY IMPORTANT: when running the MicroRTS.jar file or when using one of IntelliJ IDEA's run configuration, always use the path ~/Builds/MicroRTS as working directory.

# Gitlab Changes:
- Copied the code + wiki from the original repo located at: [https://github.com/Farama-Foundation/MicroRTS](https://github.com/Farama-Foundation/MicroRTS) and [https://github.com/Farama-Foundation/MicroRTS/wiki](https://github.com/Farama-Foundation/MicroRTS/wiki)
- The original code + wiki where hosted, originally on gitlab.upb.ro, repos are: [https://gitlab.upb.ro/marius_vlad.dumitru/MicroRTS](https://gitlab.upb.ro/marius_vlad.dumitru/MicroRTS) and [https://gitlab.upb.ro/marius_vlad.dumitru/MicroRTS/-/wikis/home](https://gitlab.upb.ro/marius_vlad.dumitru/MicroRTS/-/wikis/home)
- Reorganized folders.
- Added build.sh, run.sh, run-gui.sh to have an idea of how to run the game.
- Added a post-commit git hook that run build.sh when a change is commited.
- At some point all the projects assets(maps, traces, config, bayesianmodels, ahtn) where moved into the data folder. Because of this some hardcoded paths may be broken. You need to check all .java files for these hardcoded paths and fix them.
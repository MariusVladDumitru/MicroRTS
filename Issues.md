# Wrong paths for assets in .java files
At some point, in the old gitlab repository, i moved all the projects assets(maps, traces, configs, bayesianmodels, ahtn) inside the data folder.
In the original java code, all the assets path are hard-coded. Because of this move, all hard-coded assets path are now broken.  

- You need to examine each .java file for broken hard-coded assets paths and fix them.
- The new path is where the final .jar file is installed and used NOT where the assets are in the repository.

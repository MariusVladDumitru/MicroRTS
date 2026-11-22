# Note About IntelliJ IDEA
I am using IntelliJ IDEA to work with the project.  
In order to be able to run and debug from inside IntelliJ IDEA, a setup have to be performed:  
    1. Create a new IntelliJ Java Project in the MicroRTS directory(project will be created at ~/Projects/MicroRTS using existing sources)   
    2. Go to File -> Project Structure -> Modules -> MicroRTS (it should automatically be added as a module)  
    3. Make Sure you are in the Sources tab  
    4. Click the address of the module(/home/marius-vlad/Projects/MicroRTS) this will enable the Mark as section  
    5. Mark the MicroRTS module as source. It will also appear to the right, in the Source folders Section.  
    6. Similar mark all the folders inside code/game as Source Folders. Make sure that they are listed in the Source Folders to the right  
    7. Go to File -> Project Structure -> Libraries.  
    8. Add EACH INDIVIDUAL .jar file from bin/lib (both from bin/lib and bin/lib/bots)  
    9. Go back to File -> Project Structure -> Modules -> MicroRTS module  
    10. Go To Dependencies Tab.  
    11. Make sure all the .jar files that you added previously are listed as dependency. There is no need to tick compile checkbox because the .jars are already compiled.  
    12. Create a new run configuration (next to the triangle icon)  
    13. Always use ~/Builds/MicroRTS as the working directory.  
    14. Select the main class that you want to run.  
    15. Add a name to the run configuration and make sure to check the box Store as project file so that you save this new run config with git.  
    16. Click Apply then OK.  
    17. Now you can use the new run configuration to run and debug your class.  
    MAKE SURE TO ALWAYS USE ~/Builds/MicroRTS as the working directory in the run configuration
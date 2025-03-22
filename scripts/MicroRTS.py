from platform import system
from sys import argv
from pathlib import Path
from os import environ, walk, chdir
from os.path import exists
import subprocess #from subprocess import run


class MicroRTS:
    """
    Also check dev-docs/MicroRTS.py_Implementation.txt -> THIS IS WAY MORE DETAILED.

    Parses and interprets the commands and arguments when calling MicroRTS.py script.

    MicroRTS.py <command> [<arguments>] (<arguments> have different meaning based on <command>)

    MicroRTS.py <command>:
        setup: Prepares the shell by executing one of the two Setup files from <PROJECT_ROOT>/scripts> and adds <PROJECT_ROOT>/scripts folder to path.
               For Windows -> creates a new instance of cmd that executes Setup.bat and adds <PROJECT_ROOT>/scripts folder to path.
               For Linux -> creates a new instance of bash that executes Setup.sh and adds <PROJECT_ROOT>/scripts folder to path.
        
        build [<build_path>]: builds the whole game into a single MicroRTS.jar file. 
                              All the intermediate files and final MicroRTS.jar file are to be written in <build_path> specified by the user.
                              If <build_path> IS VALID then <build_path> is used.
                              If <build_path> is omitted/empty/INVALID then the default value <build_path> (default value) = <PROJECT_ROOT>/build is used.
                              <build_path> is NOT LOST after the execution of MicroRTS.py ends. It is saved and available for the next execution of MicroRTS.py.
                              
        clean [<clean_path>]: deletes all the intermediate files and final MicroRTS.jar from <clean_path> or <build_path>.
                              If <clean_path> is VALID then <clean_path> is used.
                              If <clean_path> is omitted/empty/INVALID then <build_path> is used. If <build_path> is empty/INVALID the the default value <build_path> (default_value) = <PROJECT_ROOT>/build is used.

        start [<MicroRTS.py_path>][<game_arguments>]: creates a new instance the game with optional <game_arguments> using the cmd/bash instance already started with the previous setup command. Performs a chech if setup was executed before(use the RUN_SETUP environment variable). 
                                  <game_arguments> are passed directly to the game.
                                  If an older instance of the game is already running, then a new instance WILL NOT BE started. An error will pop up. 

        start-gui [<game_arguments>]: creates a new instance of the game gui with optional <game_arguments> using the cmd/bash instance already started with the previous setup command.Performs a check if setup was executed before(use the RUN_SETUP environment variable).  
                                      <game_arguments> are passed directly to the game.
                                      If an older instance of the game-gui is already running, then a new instance WILL NOT BE started. An error will pop up. 


        stop: Ends the execution of the game or game gui.
    """
    def __init__(self):
        arg = ''
        self.shell = ''
        self.argv = argv
        self.PROJECT_ROOT = Path(__file__).resolve().parent.parent # Path() object
        match self.__get_os():
            case 'Windows':
                self.shell = 'cmd'
                arg = '/c echo hello'

            case 'Linux':
                self.shell = 'bash' # only bash is supported on linux
                arg = '--version'

            case 'Mac':
                self.shell = 'bash' # only bash is supported on linux
                arg = '--version'

        # check if self.shell is working - do i have the needed shell available ?
        try:
            subprocess.run([self.shell, arg], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        except FileNotFoundError:
            print(self.shell, " is NOT installed.")
            exit()
        except subprocess.CalledProcessError:
            print(self.shell, "is installed but returned an error.")
            exit()

    def __setup(self):
        """
        Command: MicroRTS.py setup
        Executes the setup command. See dev-docs/MicroRTS.py_Implementation.txt for details.
        """
        print("Executing setup command...")
        
        # prevent the command from running a second time.
        # You only need setup command just once, after you open up your terminal.
        if 'SETUP_ENV' in environ:
            print("setup command was previously executed, exiting...")
            print("Ending Setup Command...")
            exit()

        # preserve the old path
        oldpath = environ['PATH']

        # set the delimiter, arguments, setup file, depending on the used shell
        match self.shell:
            case 'cmd':
                delimiter = ';'
                setup_file = 'Windows\\SetupEnv.bat' 
                shell_arg = '/k'

            case 'bash':
                pass    
               # delimiter = ':'
               # setup_file = 'Linux/SetupEnv.sh'

       # add <PROJECT_ROOT>/scripts to path 
        environ['PATH'] = oldpath + delimiter + str(self.PROJECT_ROOT / 'scripts')

        # execute SetupEnv.bar / SetupEnv.sh
        command = [self.shell, shell_arg, str(self.PROJECT_ROOT / 'scripts' / setup_file)]
        # chdir(self.PROJECT_ROOT / 'scripts' / 'Windows') # if you want to support linux too, you need to modify here.
        if self.__run_command(command) != 0:
            print("Error, cannot start the shell. Close and reopen this terminal, execute RunSetup again", self.shell)
            exit()
        
        # When exiting the shell(typing exit) tell the user it needs to run MicroRTS.py setup again.
        print("Run <PROJECT_ROOT>/scripts/MicroRTS.py setup again")
        print("Ending Setup Command...")
    def __build(self):
        """
        Command: MicroRTS.py build

        Implements the build command.
        """
        print("Executing build command...")

        # was setup executed ?
        if 'SETUP_ENV' not in environ:
            self.__setup()

        # do i have <build_path>
        if len(self.argv) >= 3:
            build_path = self.argv[2] # <build_path> value

            #does build_path exist ?
            if not exists(build_path):
                build_path = self.PROJECT_ROOT / 'build'
        else:
            # <build_path> omitted
            build_path = self.PROJECT_ROOT / 'build'

        # set BUILD_PATH environment variable
        environ['BUILD_PATH'] = str(build_path)
        
        java_files = [] # all .java files
        for dirpath, _, filenames in walk(str(self.PROJECT_ROOT / 'src')):
            for filename in filenames:
                java_files.append(dirpath + '\\' + filename) # if you support linux, need to modify here

        # if you want to support linux, the you need to change \ into / here.
        # you need to make modification here for linux support
        for filename in java_files:
            if not filename.endswith('.java'):
                continue
            stage1 = ['javac', '-cp', str(self.PROJECT_ROOT / 'lib\\*') + ';' + str(self.PROJECT_ROOT / 'src'), '-d', str(build_path), '-Xlint:all', '-Xmaxwarns', '10000', '-Xmaxerrs', '10000',  filename]
            print("Building file:", filename)
            if self.__run_command(stage1) != 0:
                print("Error, cannot run build stage1, failed at compiling the file", filename)
                environ['BUILD_DONE'] = 'False'
                self.__clean()
                exit()

        environ['BUILD_DONE'] = 'True' 
        print("Ending build command...")
    def __clean(self):
        """
        Command: MicroRTS.py clean
        """
        print("Executing clean command...")
        print("Ending clean command...")

    def __start(self, game_args):
        """
        Command: MicroRTS.py start [<game_args>]
        """
        print("Executing start command...")
        print("Ending start command...")

    def __start_gui(self, game_args):
        """
        Command: MicroRTS.py start-gui [<game_args>]
        """
        print("Executing start-gui command...")
        print("Ending start-gui command...")
    
    def __stop(self):
        """
        Command: MicroRTS.py stop
        """
        print("Executing stop command...")
        print("Ending stop command...")
    def parse_args(self):
        """
        Parse arguments.
        Based on the input arguments provided to MicroRTS.py, calls the corresponding method.
        """
        if len(self.argv)== 1:
            self.__help('Please provide an argument')
             
        match self.argv[1]:
            case 'setup':
                self.__setup()

            case 'build':
                self.__build()

            case 'clean':
                self.__clean()

            case 'start':
                self.__start()

            case 'start-gui':
                self.__start_gui()

            case 'stop':
                self.__stop()

            case _:
                self.__help('Invalid Argument.')

    def __help(self, message):
        """
        Input:
            message [string]: the message to be displayed

        Output: none

        Prints a message and the available arguments
        """
        print("<PROJECT_ROOT>/scripts/MicroRTS.py:")
        print(message)
        print("Options are: setup, build, clean, start, start-gui, stop")
        exit()

    def __get_os(self):
        match system():
            case 'Windows':
                return 'Windows'
            
            case 'Linux':
                return 'Linux'
            
            case 'Darwin':
                return 'Mac'

            case _:
                print("Unsupported operating system. The supported operating systems are Windows, Linux, Mac")
                exit()
                
    def __run_command(self, arguments):
        """
        Input:
            arguments [list] -> A list of string arguments. The first element is always the command to run, all the other elements are arguments that the command to run receives. arguments are passed directly to process.run
        Output:
            status [int] -> The status of the execution:
                            0 - execution was ok.
                            any other value - execution has an error.

       Uses process.run to execute a command. The command is the first element of arguments. All other elements are the arguments passed to command.
        """
        return subprocess.run(arguments, shell=True)

if __name__ == "__main__":
    MicroRTS = MicroRTS()
    MicroRTS.parse_args()

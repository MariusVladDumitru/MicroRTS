from platform import system
from sys import argv
from pathlib import Path
from os import environ
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
        # preserve the old path
        oldpath = environ['PATH']

        # set the delimiter, arguments, setup file, depending on the used shell
        match self.shell:
            case 'cmd':
                delimiter = ';'
                setup_file = 'Windows\\SetupEnv.bat'
                arg = '/k'

            case 'bash':
                pass    
               # delimiter = ':'
               # setup_file = 'Linux/SetupEnv.sh'
               # arg = '--rcfile'

       # add <PROJECT_ROOT>/scripts to path 
        environ['PATH'] = oldpath + delimiter + str(self.PROJECT_ROOT / 'scripts')

        # execute SetupEnv.bar / SetupEnv.shh
        command = str(self.PROJECT_ROOT / 'scripts' / setup_file)
        subprocess.run([self.shell, arg, command])

        # When exiting the shell(typing exit) tell the user it needs to run MicroRTS.py setup again.
        print("Run <PROJECT_ROOT>/scripts/MicroRTS.py setup again")
        
    def __build(self):
        """
        Command: MicroRTS.py build
        """
        pass

    def __clean(self):
        """
        Command: MicroRTS.py clean
        """
        pass

    def __start(self, game_args):
        """
        Command: MicroRTS.py start [<game_args>]
        """
        pass

    def __start_gui(self, game_args):
        """
        Command: MicroRTS.py start-gui [<game_args>]
        """
        pass
    
    def __stop(self):
        """
        Command: MicroRTS.py stop
        """
        pass

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

if __name__ == "__main__":
    MicroRTS = MicroRTS()
    MicroRTS.parse_args()

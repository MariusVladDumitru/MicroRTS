import argparse
import platform
import subprocess

class MicroRTS:
    """
    USE THIS SCRIPT. DO NOT RUN MicroRTS.jar directly
         
    Offers the logic needed to process and execute the given input commands:
    
    MicroRTS.py <command> [<arguments>]

    MicroRTS.py <command>:
        setup: prepares the shell by calling Setup.bat/Setup.sh (depending on the operating system) and adds <PROJECT_ROOT>/scripts to path.
        build: builds the game into a single .jar file at <PROJECT_ROOT>/build/MicroRTS.jar. MAYBE ALLOW BUILD IN DIFFERENT FOLDER ??
        clean: empty the contens of <PROJECT_ROOT>/build/* folder. Deletes MicroRTS.jar.
        start [<game_arguments>]: Runs the game with optional <game_arguments>. <game_arguments> are passed directly to the game.
        start-gui [<game_arguments>]: Runs the game gui with optional <game_arguments>. <game_arguments> are passed directly to the game.
        stop: Ends the execution of the game.
    """
    def __init__(self):
        arg = ''
        self.shell = ''

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

        # check if self.shell is working
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
        """
        pass

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
        print("parsing arguments") 

    def __get_os(self):
        match platform.system():
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
    print("This is MicroRTS.py file")
    MicroRTS = MicroRTS()
    MicroRTS.parse_args()
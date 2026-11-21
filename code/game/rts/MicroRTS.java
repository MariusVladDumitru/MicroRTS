package rts;

import gui.frontend.FrontEnd;
import java.net.ServerSocket;
import java.net.Socket;

/***
 * The main class for running a MicroRTS game. To modify existing settings change the file "config.properties".
 */

//----- Start MicroRTS class -----
public class MicroRTS {
//----- START public static void main(String args[]) -----
    public static void main(String args[]) throws Exception {
        //when -h is passed as commandline parameter prints out all the supported commandline parameters
        for (int i = args.length; i > 0; i--) {
            if (args[i - 1].equals("-h")) {
                System.out.println(GameSettings.getHelpMessage());
                return;
            }
        }

        //configFile default path
        String configFile = "data/configs/config.properties";

        // If the user provided a path to a config file, use that.
        for (int i = args.length; i > 0; i--) {
            if (args[i - 1].equals("-f")) {
                configFile = args[i]; // -f configFilePath -> config File Path read from commandline parameter
            }
        }

        //Load game settings from provided configFile, if it exists, or load game settings from commandline
        GameSettings gameSettings;
        try {
            //Load game settings from provided configFile, if it exists.
            //If commandline setting where provided then they are used instead of those from configFile.
            //When commandline settings are provided they replace the ones from configFile
            gameSettings = GameSettings.loadFromConfig(GameSettings.fetchConfig(configFile)) // load game settings from configFile
                .overrideFromArgs(args); //overwrite previous game settings(from file) with any configuration from command line
        } catch (java.io.FileNotFoundException ex) {
            //When there is no configFile present, use only commandline game settings.
            System.err.println(
                "File " + configFile + " not found. Trying to initialize from command-line args.");
            gameSettings = new GameSettings(args); // create a new GameSettings object initialized from commandline arguments.
        }

        //print the current game settings
        System.out.println(gameSettings);

        //start the game
        switch (gameSettings.getLaunchMode()) {
            case STANDALONE:
            case HUMAN:
                runStandAloneGame(gameSettings);
                break;
            case GUI:
                FrontEnd.main(args);
                break;
            case SERVER:
                startServer(gameSettings);
                break;
            case CLIENT:
                startClient(gameSettings);
                break;
        }
    }
    // ----- END public static void main(String args[]) -----

    /**
     * Starts microRTS as a server instance.
     * @param gameSettings The game settings.
     */
    private static void startServer(GameSettings gameSettings) throws Exception {
        try(ServerSocket serverSocket = new ServerSocket(gameSettings.getServerPort())) {
            while(true) {
                try( Socket socket = serverSocket.accept() ) {
                    new RemoteGame(socket, gameSettings).run();
                } catch (Exception e ) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * Starts microRTS as a client instance.
     * @param gameSettings The game settings.
     */
    private static void startClient(GameSettings gameSettings) throws Exception {
        Socket socket = new Socket(gameSettings.getServerAddress(), gameSettings.getServerPort());
        new RemoteGame(socket, gameSettings).run();
    }
    
    
    /**
     * Starts a standalone game of microRTS with the specified opponents, and game setting
     * @param gameSettings
     * @throws Exception 
     */
    public static void runStandAloneGame(GameSettings gameSettings) throws Exception {
        if (gameSettings.getLaunchMode() == GameSettings.LaunchMode.STANDALONE)
            new Game(gameSettings).start();
        else if (gameSettings.getLaunchMode() == GameSettings.LaunchMode.HUMAN)
            new MouseGame(gameSettings).start();
    }
}
//----- END MicroRTS class -----
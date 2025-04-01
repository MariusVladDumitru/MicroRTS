# Run MicroRTS game in Windows powershell

# The root folder of MicroRTS project
# The W: drive must be substed
$env:ROOT= 'W:\Active\Dissertation_Thesis\Code\MicroRTS

# Go to build folder
Set-Location $ROOT/build

# JAVA JDK must be in $env:PATH
# MicroRTS.jar must be in build
# @args - pass all arguments the script gets to MicroRTS.jar
& java -cp ./MicroRTS.jar gui.frontend.FrontEnd @args

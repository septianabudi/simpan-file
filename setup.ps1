$site = read-host "Which branch?"
$Path = "D:\make\"
$Driver = "D:\Elite"

set-timezone -name "central standard time"
echo "Time zone set"
copy-item $Path'link\*' -Destination 'C:\Users\Default\Desktop'
copy-item $Path'Setup.Def.en-us_O365BusinessRetail_053e57a3-ac9a-4283-a30d-106b4a29b15b_TX_PR_Platform_def_b_32_.exe' -destination C:\Users\admin\Downloads
echo "Copied Stuff"

start-process C:\Users\admin\Downloads\Setup.Def.en-us_O365BusinessRetail_053e57a3-ac9a-4283-a30d-106b4a29b15b_TX_PR_Platform_def_b_32_.exe
echo "Starting O365 install"
Start-Process -wait $Path'7z1900-x64' -ArgumentList "/S"
echo "7Zip installed"
Start-Process -wait $Path'ChromeSetup'
echo "Chrome Installed"
Start-Process -wait $Path'Teams_windows_x64' -ArgumentList "/S"
echo "Teams Installed"
Start-Process -wait $Path'vlc-3.0.8-win32' -ArgumentList "/S"
echo "VLC Installed"
﻿Start-Process -wait D:\Make\ndp48-web -ArgumentList "/S"
echo ".Net installed"

switch ($site) {
    CB {Start-Process -wait $Path'AgentSetup_Council+Bluffs' -ArgumentList "/S"}
    AL {Start-Process -wait $Path'AgentSetup_Des+Moines' -ArgumentList "/S"}
    SF {Start-Process -wait $Path'AgentSetup_Sioux+Falls' -ArgumentList "/S"}
    DV {Start-Process -wait $Path'AgentSetup_Davenport' -ArgumentList "/S"}
    MR {Start-Process -wait $Path'AgentSetup_East+Peoria' -ArgumentList "/S"}
    KC {Start-Process -wait $Path'AgentSetup_Kansas+City' -ArgumentList "/S"}
    SC {Start-Process -wait $Path'AgentSetup_Sioux+City' -ArgumentList "/S"}
    default { echo "The options are CB, AL, SF, DV, MR, KC, SC" }
}
echo "RMM installed"

cd $Driver
foreach ($exectuable in get-childitem) {
    Start-Process -wait $exectuable -ArgumentList "/S"
    echo "Installed"
}
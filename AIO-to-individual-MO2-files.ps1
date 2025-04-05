#######################################################################################
#
# INSTRUCTIONS:
#     Must have 7zip installed to "C:\Program Files\7-Zip"
#     Create new folder
#     Add this file to the folder
#     Add "A. Modular Hard Mode - AIO-88-<whatever>.7z" to the same folder as this file
#     Right click this file and select run with powershell
#
#######################################################################################


#
# Variables
#
$MOD_ID  = '88'
$VERSION = '2-0-8G'
$OTHER_THING = '1743824818'


#
# Extract AIO
#
& "C:\Program Files\7-Zip\7z.exe" x '.\A. Modular Hard Mode - AIO-88-*7z'


#
# Make directories for the output
#
mkdir '.\MHM-AIO-Hardcore\Content\Paks\~mods'
mkdir '.\MHM-AIO-Standard\Content\Paks\~mods'
mkdir '.\MHM-Localization\Content\Paks\~mods'
mkdir '.\MHM-Interface\Content\Paks\~mods'
mkdir '.\MHM-Textures\Content\Paks\~mods'
mkdir '.\MHM-Addon-Weather\Content\Paks\~mods'
mkdir '.\MHM-Addon-Gamepad\Content\Paks\~mods'
mkdir '.\MHM-Addon-MasterMode\Content\Paks\~mods'
mkdir '.\MHM-Addon-Campfire\Content\Paks\~mods'
mkdir '.\MHM-Addon-Reshade\Binaries\Win64'
mkdir '.\MHM-Addon-Relaxed\Content\Paks\~mods'
mkdir '.\MHM-Patch-FAW\Content\Paks\~mods'
mkdir '.\MHM-Patch-FAW-MasterMode\Content\Paks\~mods'
mkdir '.\MHM-Patch-PotZ\Content\Paks\~mods'
mkdir '.\MHM-Patch-Svarog\Content\Paks\~mods'


#
# Move files to appropriate folders
#
mv '.\zzzzzzz_MHM_Interface0z_P.*'            '.\MHM-Interface\Content\Paks\~mods'
mv '.\zzzzzzz_MHMTextures0z_P.*'              '.\MHM-Textures\Content\Paks\~mods'
mv '.\A. Hardcore AIO\*.pak'                  '.\MHM-AIO-Hardcore\Content\Paks\~mods'
mv '.\B. Standard AIO\*.pak'                  '.\MHM-AIO-Standard\Content\Paks\~mods'
mv '.\Localization*\Real*\LocalizationDB_P.*' '.\MHM-Localization\Content\Paks\~mods'
mv '.\*Addons*\*Weather*\*pak'                '.\MHM-Addon-Weather\Content\Paks\~mods'
mv '.\*Addons*\*Gamepad*\*pak'                '.\MHM-Addon-Gamepad\Content\Paks\~mods'
mv '.\*Addons*\*Master*\*pak'                 '.\MHM-Addon-MasterMode\Content\Paks\~mods'
mv '.\*Addons*\*Campfire*\*pak'               '.\MHM-Addon-Campfire\Content\Paks\~mods'
mv '.\*Addons*\*Color*\MHM.ini'               '.\MHM-Addon-Reshade\Binaries\Win64'
mv '.\*Addons*\*Relaxed*\*pak'                '.\MHM-Addon-Relaxed\Content\Paks\~mods'
mv '.\*Patches*\*Found*Way*\*MasterMode*pak'  '.\MHM-Patch-FAW-MasterMode\Content\Paks\~mods'
mv '.\*Patches*\*Found*Way*\*pak'             '.\MHM-Patch-FAW\Content\Paks\~mods'
mv '.\*Patches*\*Painter*\*pak'               '.\MHM-Patch-PotZ\Content\Paks\~mods'
mv '.\*Patches*\*Svarog*\*pak'                '.\MHM-Patch-Svarog\Content\Paks\~mods'


#
# Remove leftovers
#
rm '.\A. Hardcore*'  -r -Force
rm '.\B. Standard*'  -r -Force
rm '.\Localization*' -r -Force
rm '.\Patches*'      -r -Force
rm '.\*pak'
rm '.\*ucas'
rm '.\*utoc'


#
# Move folders into archives
#
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM AIO - Hardcore-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"         '.\MHM-AIO-Hardcore\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM AIO - Standard-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"         '.\MHM-AIO-Standard\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Localization-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"           '.\MHM-Localization\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Interface-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"              '.\MHM-Interface\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Textures-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"               '.\MHM-Textures\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Addon - Weather-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"        '.\MHM-Addon-Weather\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Addon - Gamepad-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"        '.\MHM-Addon-Gamepad\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Addon - MasterMode-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"     '.\MHM-Addon-MasterMode\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Addon - Campfire-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"       '.\MHM-Addon-Campfire\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Addon - Reshade-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"        '.\MHM-Addon-Reshade\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Addon - Relaxed-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"        '.\MHM-Addon-Relaxed\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Patch - FAW-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"            '.\MHM-Patch-FAW\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Patch - FAW MasterMode-${MOD_ID}-${VERSION}-${OTHER_THING}.7z" '.\MHM-Patch-FAW-MasterMode\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Patch - PotZ-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"           '.\MHM-Patch-PotZ\*' -sdel
& "C:\Program Files\7-Zip\7z.exe" a ".\MHM Patch - Svarog-${MOD_ID}-${VERSION}-${OTHER_THING}.7z"         '.\MHM-Patch-Svarog\*' -sdel


#
# Remove now empty directories
#
rm '.\MHM-AIO-Hardcore'          -r -Force
rm '.\MHM-AIO-Standard'          -r -Force
rm '.\MHM-Localization'          -r -Force
rm '.\MHM-Interface'             -r -Force
rm '.\MHM-Textures'              -r -Force
rm '.\MHM-Addon-Weather'         -r -Force
rm '.\MHM-Addon-Gamepad'         -r -Force
rm '.\MHM-Addon-MasterMode'      -r -Force
rm '.\MHM-Addon-Campfire'        -r -Force
rm '.\MHM-Addon-Reshade'         -r -Force
rm '.\MHM-Addon-Relaxed'         -r -Force
rm '.\MHM-Patch-FAW'             -r -Force
rm '.\MHM-Patch-FAW-MasterMode'  -r -Force
rm '.\MHM-Patch-PotZ'            -r -Force
rm '.\MHM-Patch-Svarog'          -r -Force

##############################################################
#
# INSTRUCTIONS
#   1. Create new folder
#   2. Place this file in that folder
#   3. Place downloaded MHM AIO 7z file into that folder as well
#   4. Customize the below section to your LIKING
#   5. Right click this file and select run with powershell
#
##############################################################



###############################################################################################################
#
# CUSTOMIZE THESE TO YOUR LIKING
#
# These options will send the pak files into the mod named on the right
#     $aio_hardcore = 'MHM - AIO - Hardcore'
#     Sends the pak file "zzzzzz_MHM_2.0_AIO_Full_Hardcore.pak" into a mod called 'MHM - AIO Hardcore'
# 
#
# To send for example both of the 'Found a Way' patches into a single mod, just set them to have the same name:
#     $patches_faw_regular  = 'MHM - Patch - A-Life Found a Way'
#     $patches_faw_master   = 'MHM - Patch - A-Life Found a Way'
#
# Only things in this section should need changing, leave everything else alone.
#
###############################################################################################################

$7z_dir               = 'C:\Program Files\7-Zip'
$aio_hardcore         = 'MHM - AIO - Hardcore'
$aio_standard         = 'MHM - AIO - Standard'
$localization_vanilla = 'MHM - Localization - Vanilla'
$localization_rwng    = 'MHM - Localization - RWNG'
$textures             = 'MHM - Textures'
$interface            = 'MHM - Interface'
$addon_gamepad        = 'MHM - Addon - Gamepad'
$addon_master_mode    = 'MHM - Addon - Master Mode'
$addon_campfire_saves = 'MHM - Addon - Campfire Saves'
$addon_reshade        = 'MHM - Addon - Reshade - Color Fix'
$addon_reshade_gloom  = 'MHM - Addon - Reshade - Gloom'
$addon_weather        = 'MHM - Addon - Weather'
$addon_relaxed_mode   = 'MHM - Addon - Relaxed Mode'
$patches_faw_regular  = 'MHM - Patch - A-Life Found a Way - Regular'
$patches_faw_master   = 'MHM - Patch - A-Life Found a Way - Master Mode'
$patches_potz         = 'MHM - Patch - Painter of the Zone'
$patches_svarog       = 'MHM - Patch - Svarog Detector'



############################################
#
# extract mod id, version, etc from filename
#
############################################
$filename = (Get-ChildItem ".\" -Filter "*7z").Name[0]
$_ = $filename -match "^.*Modular Hard Mode.*AIO-(\d\d)-(.*)-(.*).7z$"
if($filename -ne $matches[0]) {
	Write-Host "MHM AIO file not found. Please run this from the same folder as the downloaded .7z file."
	Read-Host -Prompt 'Press Enter to exit'
	exit
}
$mod_id      = $matches[1]
$version     = $matches[2]
$other_thing = $matches[3]



##########################
#
# extract the AIO zip file
#
##########################

Write-Host "Extracting AIO zip... " -NoNewLine
& "${7z_dir}\7z.exe" x '.\A. Modular Hard Mode - AIO*7z' -aoa > $null
Write-Host "Done!"



##################################
#
# make folders for individual mods
#
##################################

$mods_standard = @(
	$aio_hardcore, 
	$aio_standard, 
	$localization_vanilla, 
	$localization_rwng, 
	$textures, 
	$interface, 
	$addon_gamepad, 
	$addon_master_mode, 
	$addon_campfire_saves, 
	$addon_weather, 
	$addon_relaxed_mode, 
	$patches_faw_regular, 
	$patches_faw_master, 
	$patches_potz, 
	$patches_svarog
)
$mods_special = @(
	$addon_reshade, 
	$addon_reshade_gloom
)
$mods_all = $mods_standard + $mods_special
$folders_standard = '\Content\Paks\~mods'
$folders_special  = '\Binaries\Win64'
Write-Host "Creating folders... " -NoNewLine
foreach ($folder in $mods_standard) { mkdir ".\${folder}${folders_standard}" -Force > $null }
foreach ($folder in $mods_special)  { mkdir ".\${folder}${folders_special}"  -Force > $null }
Write-Host "Done!"



#######################################
#
# move extracted files into mod folders
#
#######################################

Write-Host "Moving extracted files into folders... " -NoNewLine
mv '.\A. Hardcore AIO\*.pak'                     ".\${aio_hardcore}${folders_standard}" > $null
mv '.\B. Standard AIO\*.pak'                     ".\${aio_standard}${folders_standard}" > $null
mv '.\localization*\Real*\localizationDB_P.*'    ".\${localization_rwng}${folders_standard}" > $null
mv '.\localization*\Vanilla*\localizationDB_P.*' ".\${localization_vanilla}${folders_standard}" > $null
mv '.\zzzzzzz_MHMtextures0z_P.*'                 ".\${textures}${folders_standard}" > $null
mv '.\zzzzzzz_MHM_interface0z_P.*'               ".\${interface}${folders_standard}" > $null
mv '.\*Addons*\*Gamepad*\*pak'                   ".\${addon_gamepad}${folders_standard}" > $null
mv '.\*Addons*\*Master*\*pak'                    ".\${addon_master_mode}${folders_standard}" > $null
mv '.\*Addons*\*Campfire*\*pak'                  ".\${addon_campfire_saves}${folders_standard}" > $null
mv '.\*Addons*\*Weather*\*pak'                   ".\${addon_weather}${folders_standard}" > $null
mv '.\*Addons*\*Relaxed*\*pak'                   ".\${addon_relaxed_mode}${folders_standard}" > $null
mv '.\*Patches*\*Found*Way*\*MasterMode*pak'     ".\${patches_faw_master}${folders_standard}" > $null
mv '.\*Patches*\*Found*Way*\*pak'                ".\${patches_faw_regular}${folders_standard}" > $null
mv '.\*Patches*\*Painter*\*pak'                  ".\${patches_potz}${folders_standard}" > $null
mv '.\*Patches*\*Svarog*\*pak'                   ".\${patches_svarog}${folders_standard}" > $null
mv '.\*Addons*\*Color*\MHM.ini'                  ".\${addon_reshade}${folders_special}" > $null
mv '.\*Addons*\*Color*\MHMgloom.ini'             ".\${addon_reshade_gloom}${folders_special}" > $null
Write-Host "Done!"



##################################
#
# delete the extracted directories
#
##################################

Write-Host "Deleting extracted directories... " -NoNewLine
rm '.\A. Hardcore*'  -r -Force > $null
rm '.\B. Standard*'  -r -Force > $null
rm '.\localization*Required*' -r -Force > $null
rm '.\Patches*'      -r -Force > $null
Write-Host "Done!"



######################################################
#
# zip up the mods into archives and delete the folders
#
######################################################

Write-Host "Creating mod archives..."
foreach ($mod in $mods_all)
{
	if (Test-Path -Path $mod) {
		Write-Host "    ${mod}... " -NoNewLine
		& "${7z_dir}\7z.exe" a "${mod}-${mod_id}-${version}-${other_thing}.7z" ".\${mod}\*" -sdel > $null
		rm ".\${mod}" -r -Force > $null
		Write-Host "Done!"
	}
}
Read-Host -Prompt 'Press Enter to exit'

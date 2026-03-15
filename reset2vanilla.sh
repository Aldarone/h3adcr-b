#!/usr/bin/env bash
set -eu

SteamInstallDir=$HOME/.steam/steam
FlatpakSteamInstallDir=$HOME/.var/app/com.valvesoftware.Steam/.steam/steam
FlatpakSLSsteamInstallDir=$HOME/.var/app/com.valvesoftware.Steam/.local/share/SLSsteam
FlatpakSLSsteamConfigDir=$HOME/.var/app/com.valvesoftware.Steam/.config/SLSsteam
SLSsteamInstallDir=$HOME/.local/share/SLSsteam
SLSsteamConfigDir=$HOME/.config/SLSsteam
Headcrab_Downgrader_Path=$HOME/.headcrab

  read_os_release(){
        local f
        OS_ID=""
        OS_ID_LIKE=""
        for f in /etc/os-release /usr/lib/os-release; do
            [ -r "$f" ] || continue
            . "$f"
            break
        done
        OS_ID=${ID:-}
        OS_ID_LIKE=${ID_LIKE:-}
    }
    
  bazzitecheck(){
        read_os_release
        [ "$OS_ID" = "bazzite" ]
        }
        
  wheresteam(){
        if [ -d "$FlatpakSteamInstallDir" ]; then
                flatpak run com.valvesoftware.Steam "$@"
        else
                steam "$@"
            fi
                echo "" &> /dev/null
            }
            
  resetlaunch(){
        rm -rf "$Headcrab_Downgrader_Path"
        if [ -d "$FlatpakSteamInstallDir" ]; then
               cd $FlatpakSteamInstallDir/
        else
                cd $SteamInstallDir/
            fi
                revertsteam 
            }
            
    revertsteam(){
      if [ -f steam.cfg ]; then
        rm steam.cfg
      else
        echo "steam.cfg does not exist"
      fi
        rm steam.sh
        purgemillennishit
        }
        
    purgemillennishit(){
      cd ubuntu12_32/
      if [ -f "libXtst.so.6" ]; then
        rm libXtst.so.6
      else
        echo "Millennium Not Found"
      fi
        echo "" &> /dev/null
        }

   PurgeSLSsteam(){
        if [ -d "$FlatpakSLSsteamConfigDir" ]; then
               rm -rf "$FlatpakSLSsteamInstallDir"
        else
              rm -rf "$SLSsteamInstallDir"
            fi
            }
            
  PurgeHeadcrab(){
    echo "Bashing The Headcrab With A Cr0wbar.."
    resetlaunch
    PurgeSLSsteam
    echo "Headcrab Despawned Out Of The Enviroment Reloading Save.."
    wheresteam
    }

echo "Headcrab Uninstaller"
PurgeHeadcrab





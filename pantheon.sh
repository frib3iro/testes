#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script : phanteon.sh
# Descrição :
# Versão : 0.1
# Autor : Fabio Junior Ribeiro <rib3iro@live.com>
# Data : 30/11/2020
# Licença : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso :
#----------------------------------------------------------------------

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

# Tela de boas vindas
clear
echo -e "${seta} ${ciano}Bem vindo a instalação do pantheon${fim}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${ciano}Atualizando...${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

echo -e "${seta} ${ciano}Iniciando instalação do driver virt-manager${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S xf86-video-qxl --noconfirm
clear

# Instalando o yay -------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Instalando pacotes ----------------------------------------------------
echo -e "${seta} ${ciano}Instalando pacotes necessários${fim}"
sleep 2s
yay -S pantheon-session-git pantheon-default-settings-git gnome-settings-daemon-elementary gnome-settings-daemon-ubuntu pantheon-print-git elementary-icon-theme lightdm-pantheon-greeter ttf-droid ttf-opensans ttf-raleway ttf-dejavu gnu-free-fonts ttf-liberation pantheon-files pantheon-terminal pantheon-code pantheon-calculator pantheon-music pantheon-videos pantheon-calendar-git pantheon-mail-git pantheon-screenshot eidete-bzr pantheon-photos pantheon-camera-git simple-scan switchboard pantheon-screencast elementary-wallpapers gtk-theme-elementary sound-theme-elementary --noconfirm
clear

# Downgrade---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o downgrade${fim}"
sleep 2s
yay -S downgrade --noconfirm
clear

# Firmwares -------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando os${fim} ${amarelo}firmwares warnigs${fim} ${ciano}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
clear

# Sardi-icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o sardi-icons${fim}"
sleep 2s
yay -S sardi-icons --noconfirm
clear

# Glxinfo ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o glxinfo${fim}"
sleep 2s
yay -S glxinfo --noconfirm
clear

# Google-chrome ---------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o google-chrome${fim}"
sleep 2s
yay -S google-chrome --noconfirm
clear

# Fontes ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando as fontes${fim}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

# Instalação finalizada -------------------------------------------------
echo -e "${seta} ${verde}Instalação finalizada!${fim}"


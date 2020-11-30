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
echo -e "${seta} ${ciano}Instalando o Pantheon Shell no Arch Linux${fim}"
sleep 2s
clear

echo -e "${seta} ${ciano}Adicionando o repositório alucryd a lista de repositórios do Arch${fim}"
sleep 2s
echo -e "\n[extra-alucryd]\nServer = https://pkgbuild.com/~alucryd/\$repo/\$arch\n" | sudo tee -a /etc/pacman.conf

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
yay --sortby popularity --topdown --nodiffmenu --save
clear

# Downgrade---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o downgrade${fim}"
sleep 2s
yay -S downgrade --noconfirm
clear

# vala -------------------------------------------------------------------
echo -e "${seta} ${ciano}Fazendo o downgrade do vala${fim}"
sleep 2s
downgrade vala
clear

# mutter -------------------------------------------------------------------
echo -e "${seta} ${ciano}Fazendo o downgrade do mutter${fim}"
sleep 2s
downgrade mutter
clear

# Instalando pacotes ----------------------------------------------------
echo -e "${seta} ${ciano}Instalando pacotes necessários${fim}"
sleep 2s
yay -S cerbere contractor elementary-icon-theme elementary-wallpapers epiphany file-roller gala geary gnome-settings-daemon-elementary granite gtk-theme-elementary lightdm lightdm-pantheon-greeter-git networkmanager pantheon-applications-menu pantheon-calculator pantheon-calendar pantheon-camera pantheon-code pantheon-default-settings pantheon-dpms-helper pantheon-files gvfs pantheon-geoclue2-agent pantheon-music pantheon-photos pantheon-polkit-agent pantheon-print pantheon-screenshot pantheon-session pantheon-shortcut-overlay pantheon-terminal pantheon-videos plank sound-theme-elementary-git switchboard switchboard-plug-a11y switchboard-plug-about switchboard-plug-bluetooth switchboard-plug-datetime switchboard-plug-desktop switchboard-plug-display switchboard-plug-elementary-tweaks switchboard-plug-applications switchboard-plug-keyboard switchboard-plug-locale switchboard-plug-mouse-touchpad switchboard-plug-network switchboard-plug-notifications switchboard-plug-parental-controls switchboard-plug-power switchboard-plug-printers switchboard-plug-security-privacy switchboard-plug-sharing switchboard-plug-sound switchboard-plug-user-accounts otf-raleway ttf-dejavu ttf-droid ttf-liberation ttf-opensans wingpanel wingpanel-indicator-bluetooth wingpanel-indicator-datetime wingpanel-indicator-keyboard wingpanel-indicator-network wingpanel-indicator-nightlight wingpanel-indicator-notifications wingpanel-indicator-power wingpanel-indicator-privacy-stable-git wingpanel-indicator-session wingpanel-indicator-sound --noconfirm
clear

# Verificando os greeters disponíveis -----------------------------------
echo -e "${seta} ${ciano}O greeter do elementary deve aparecer listado como${fim} ${amarelo}io.elementary.greeter${fim}, ${ciano}caso ele não esteja, reinstale o pacote lightdm-pantheon-greeter-git${fim}"
echo -e "${seta} ${ciano}Verificando os greeters disponíveis${fim}"
sleep 2s
ls -1 /usr/share/xgreeters
clear

# greeter session -------------------------------------------------------------
echo -e "${seta} ${ciano}Alterando o tema padrão do Lightdm${fim}\n"
sleep 2
sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=io.elementary.greeter/' /etc/lightdm/lightdm.conf
clear

# Firmwares -------------------------------------------------------------
echo -e "${seta} ${ciano}Definindo o Lightdm como gerenciador de login padrão${fim}"
sleep 2s
echo $pass_user | sudo -S systemctl start lightdm && systemctl enable lightdm
clear

# Firmwares -------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando os${fim} ${amarelo}firmwares warnigs${fim} ${ciano}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
clear


# Urutau-Icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o Urutau-Icons${fim}"
sleep 2s
yay -S urutau-icons-git
gsettings set org.gnome.desktop.interface icon-theme "urutau-icons"
clear

# Sardi-icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o sardi-icons${fim}"
sleep 2s
yay -S sardi-icons --noconfirm
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


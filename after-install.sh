# First you update your system
sudo apt update && sudo apt-get dist-upgrade 

# Clean-up System
sudo apt purge epiphany-browser epiphany-browser-data #browser
sudo apt purge midori-granite #browser
# sudo apt-get purge noise # music player

sudo apt autoremove
sudo apt autoclean

# Properties Commons (to install elementary tweaks)
sudo apt install software-properties-common -y
# gdebi for easy click-install of *.deb
sudo apt install gdebi -y
#Install File Compression Libs
sudo apt install rar unrar zip unzip p7zip-full p7zip-rar -y
# GIT
sudo apt install git -y
# essential programs
sudo apt install g++ libtool automake htop gparted vlc browser-plugin-vlc firefox inkscape shutter steam filezilla k4dirstat speedcrunch transmission libreoffice software-properties-gtk dconf -y
# Java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java8-installer -y

# Docker
sudo apt install docker.io -y
sudo gpasswd -a $USER docker

# Multimedia Codecs
sudo apt install ubuntu-restricted-extras libavcodec-extra ffmpeg -y

# Elementary Tweak
## 1. adding repository
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
## 2. updating apt-get
sudo apt update
## 3. installing tweaks
sudo apt install elementary-tweaks -y
## 4. installing wallpapers
sudo apt install elementary-wallpapers-extra -y

# KDE Connect to sync with other devices
#sudo add-apt-repository ppa:vikoadi/ppa
sudo add-apt-repository -y ppa:webupd8team/indicator-kdeconnect # alternative ppa
sudo apt update
sudo apt install kdeconnect indicator-kdeconnect -y

# Google Chrome
sudo apt install libxss1 libappindicator1 libindicator7 -y
## 1. downloading last stable package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
## 2. installing package
sudo dpkg -i google-chrome-stable_current_amd64.deb
## 3. fixing broken dependencies
sudo apt install -f
## 4. Enable maximize and minimize button on Google Chrome
#gconftool-2 --set /apps/metacity/general/button_layout --type string ":minimize:maximize:close"
rm google-chrome*.deb # free up space

#Install Spotify
## 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
## 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
## 3. Update list of available packages
sudo apt update
## 4. Install Spotify
sudo apt install spotify-client -y

#Reduce overheating and improve battery life
## 1. adding repository
sudo add-apt-repository -y ppa:linrunner/tlp
## 2. updating apt-get
sudo apt update
## 3. installing package
sudo apt install tlp tlp-rdw -y
## 4. starting application
sudo tlp start

# neofetch for Ubuntu 16.10 and below
# add ppa
sudo add-apt-repository -y ppa:dawidd0811/neofetch
# update repos
sudo apt update
# install package
sudo apt install neofetch -y

# Gnome system monitor
sudo apt install gnome-system-monitor -y
# System load indicator
sudo apt install indicator-multiload -y

# Git setup
printf "Enter your git user name: \n"
read username
printf "Enter your git email: \n"
read email
git config --global user.name ${username}
git config --global user.email ${email}

# Download git repos
mkdir -p ~/Documents/Github

# Powerline fonts
# clone
git clone https://github.com/powerline/fonts.git ~/Documents/Github/fonts
# install
~/Documents/Github/fonts/install.sh

# Papirus Icons Theme
sudo add-apt-repository -y ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme -y

# install and change shell to zsh
sudo apt install zsh
chsh -s $(which zsh)
# install oh-my-zsh
printf "Enter 'exit' after installation of oh-my-zsh is finished to get back to the installation script. \n "
printf "Press <Enter> to continue. \n "
read input
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


# add additional plugins
git clone https://github.com/arzzen/calc.plugin.zsh.git ~/.oh-my-zsh/custom/plugins/calc/
git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips/
git clone https://github.com/zdharma/history-search-multi-word.git ~/.oh-my-zsh/custom/plugins/history-search-multi-word/
git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text

# Spotify
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt update

# 4. Install Spotify
sudo apt install spotify-client


# Cerebro luncher
cd ~/Downloads
wget https://github.com/KELiON/cerebro/releases/download/v0.3.1/cerebro_0.3.1_amd64.deb
sudo gdebi cerebro_0.3.1_amd64.deb --n --q
rm cerebro_0.3.1_amd64.deb
cd ~/

# Install Anaconda

cd ~/Downloads
wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
bash Anaconda3-5.3.0-Linux-x86_64.sh
rm Anaconda3-5.3.0-Linux-x86_64.sh



# Adding personal confiuration files
cd
git clone https://github.com/rodixxi/.elementary_after_install_scrits.git
cd .elementary_after_install_scrits
ln -f .bashrc ~/
ln -f .zshrc ~/
ln -f agnoster.zsh-theme ~/.oh-my-zsh/themes/
dconf load / < dconf-settings.ini
# Use this one to save conf.. dconf dump / > dconf-settings.ini


# Final update
sudo apt update && sudo apt upgrade -y

sudo apt autoremove
sudo apt autoclean

sudo reboot
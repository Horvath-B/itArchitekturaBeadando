cd ~
#frissites es gnome telepitese
sudo apt-get update -y
sudo apt-get istall tasksel -y
sudo apt-get install task-gnome-desktop -y

#git letoltese, kesobb kelleni fog
sudo apt-get install git -y

#hatterkep beallitasa
gsettings set org.gnome.desktop.background picture-uri 'file:///home/rendszergazda/hatterkep.png'

#mappak parancsikonja a Desktop-ban
ln -s ~/Documents Desktop/Dokumentumok
ln -s ~/Downloads Desktop/Letoltesek
ln -s ~/Pictures Desktop/Kepek
ln -s ~/Videos Desktop/Videok
ln -s ~/Music Desktop/Zenek

#Desktop icons letoltese
sudo git clone https://gitlab.com/rastersoft/desktop-icons-ng.git
sudo apt-get install meson -y
sudo apt-get install gettext -y
sudo apt-get install ninja-build -y
chmod 744 desktop-icons-ng/meson.build
./desktop-icons-ng/local_install.sh
gnome-extensions enable ding@rastersoft.com

#Dash to panel letoltese
sudo apt-get install make -y
git clone https://github.com/home-sweet-gnome/dash-to-panel.git
cd dash-to-panel
make install
sudo reboot
gnome-extensions enable dash-to-panel@jderose9.github.com
cd ~

sudo reboot #teszteleskor a kiegeszitok csak 2 ujrainditas utan mukodtek
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable ding@rastersoft.com

#vegul megnyitja a webszerver honlapjat
x-www-browser http://10.0.0.4
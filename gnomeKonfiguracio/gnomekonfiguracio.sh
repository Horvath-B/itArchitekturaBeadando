cd ~
#frissites es gnome telepitese
sudo apt-get update -y
sleep 20
sudo apt-get istall tasksel -y
sleep 60
sudo apt-get install task-gnome-desktop -y
sleep 30m
#git letoltese, kesobb kelleni fog
sudo apt-get install git -y
sleep 60
#hatterkep beallitasa
gsettings set org.gnome.desktop.background picture-uri 'file:///home/rendszergazda/hatterkep.png'
#mappak parancsikonja a Desktop-ban
ln -s ~/Documents Desktop/Dokumentumok
ln -s ~/Downloads Desktop/Letoltesek
ln -s ~/Pictures Desktop/Kepek
ln -s ~/Videos Desktop/Videok
ln -s ~/Music Desktop/Zenek
sleep 5
#Desktop icons letoltese
sudo git clone https://gitlab.com/rastersoft/desktop-icons-ng.git
sleep 5
sudo apt-get install meson -y
sleep 20
sudo apt-get install gettext -y
sleep 20
sudo apt-get install ninja-build -y
sleep 60
chmod 744 desktop-icons-ng/meson.build
sleep 1
./desktop-icons-ng/local_install.sh
sleep 30
gnome-extensions enable ding@rastersoft.com
sleep 2
#Dash to panel letoltese
sudo apt-get install make -y
sleep 30
git clone https://github.com/home-sweet-gnome/dash-to-panel.git
sleep 10
cd dash-to-panel
sleep 1
make install
sleep 60
cd ~
sudo reboot
sleep 3m
gnome-extensions enable dash-to-panel@jderose9.github.com
sudo reboot #teszteleskor a kiegeszitok csak 2 ujrainditas utan mukodtek
sleep 3m
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable ding@rastersoft.com
sleep 5
#vegul megnyitja a webszerver honlapjat
x-www-browser http://10.0.0.4
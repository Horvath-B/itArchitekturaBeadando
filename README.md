# IT architektúra beadandó
Készítette: Horváth Bence (egyedül)

## A projekt

A szerver-kliens hálózatot én egy Windows Server 2022 és egy Debian Linux 12 között hoztam létre. A két virtuális gépet ugyanabba az erőforráscsoportba, hálózatba és alhálózatba telepítettem, így lokális IP-címmel is el tudják egymást érni.  
A szerveren konfiguráltam:
- Active Directory szerepkört és létre hoztam egy 'kliensfelhasznalot'
- Fájlszerver szerepkört
- Webszerver szerepkört

A kliensgép képes elérni a szerver megosztott mappáját, és onnan letölteni a használni kívánt háttérképet és a linux scriptet, ami feltelepíti az asztali környezetet. Ezen kívül látja a webszerveren elhelyezett weblapot, melyet csak ő lát, mert Azure-ban csak a kliens lokális IP-címe számára nyitottam ki a 80-as portot a szerveren.

## A github repo tartalma

### gnomeKonfiguracio mappa

#### gnomekonfiguracio.sh

Az asztali környezet telepítését tartalmazó parancsok a kliensgép számára, VSCode-ban írtam, a saját Windowsos gépemen. Az egyszerű GNOME-on kívül telepíti a 'Dash to Panel'- a 'Desktop Icons NG' bővítményeket és a 'git'-et is, beállítja a háttérképet és létrehoz parancsikonokat az asztalon a fontosabb mappákhoz.  
A 'Desktop Icons NG' valamiért nem mindig települ, tesztelésnél is hol sikerült hol nem.  
A weblapot nem nyitja meg a parancs ssh-n keresztül, csak ha a kliensgép terminálján adjuk ki.  
A windows és linux karakterkódolási különbözőségei miatt a futtatása először hibára futna, ezért át kell alakítani a __dos2unix__ paranccsal.  
A videóban bemutatott változat tartalmazott __sleep__ parancsokat a többi parancs között. Azonban ezek használatáról a videó közben kiderült, hogy felesleges, ezért utólag eltávolítottam őket.

#### hatterkep.png

Egyszerű Paintben általam rajzolt kép. Ez van a megosztott mappában és ezt használom háttérképnek a kliens gépen.

### virtualisGepek mappa

A két virtuális gépet létrehozó Azure Cloud scriptek vannak benne. Mindkét script az órán használtaknak a VSCode-ban átalakított változata.  
A szervergép scriptjében csak a gép nevét, felhasználót, erőforráscsoportot, stb. módosítottam.  
A kliensében hozzáadtam még egy tűzfal szabályt, hogy rdp-vel és ssh-val is el lehessen érni. Ezen kívül úgy állítottam át, hogy a már meglévő erőforráscsoporthoz és hálózathoz adja hozzá az új gépet.

### telepitesEsKonfiguralas

Ennek a fájlnak két változata van, egy word dokumentum és egy abból készült pdf, hogy githubon is meg lehessen nézni letöltés nélkül.  
A virtuális gépek telepítését és a szerver konfigurálását tartalmazzák lépésről-lépésre képernyőképekkel és szövegekkel.

### Video

A szervert és a klienst bemutató videó. OBS-sel vettem fel a képet és utólag Microsoft Clipchampben raktam alá hangot, mert azt nem vette fel az OBS valamiért.

## Felhasznált anyagok

A gyakorlatok diái és videói: https://moodle.uni-corvinus.hu/course/view.php?id=211625  
Ask Ubuntu oldal több lapja: 
- https://askubuntu.com/questions/66914/how-to-change-desktop-background-from-command-line-in-unity
- https://askubuntu.com/questions/803162/how-to-change-windows-line-ending-to-unix-version
- https://askubuntu.com/questions/1050460/how-to-mount-smb-share-on-ubuntu-18-04
- https://askubuntu.com/questions/8252/how-to-launch-default-web-browser-from-the-terminal
- https://stackoverflow.com/questions/29889074/how-to-wait-for-first-command-to-finish a sleep parancsot végül nem használtam  

Debian wiki, a gnome parancssal telepítéséhez: https://wiki.debian.org/Gnome#task  
Dash to Panel kiegészítő oldala: https://github.com/home-sweet-gnome/dash-to-panel/wiki/Installation  
Desktop Icons NG kiegészítő oldala: https://gitlab.com/rastersoft/desktop-icons-ng  
Saját első féléves tárgy weblapja: https://github.com/Horvath-B/webfejlesztes  
Mesterséges intelligenciát nem használtam.

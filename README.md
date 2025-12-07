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
A szervergép 

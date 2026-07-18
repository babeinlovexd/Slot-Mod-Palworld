# Guild Chest Slot Mod für Palworld (Linux Dedicated Server)

Diese Modifikation erhöht die Anzahl der Lagerplätze (Slots) in der Gilden-Truhe (Guild Chest) in Palworld. Standardmäßig bietet die Gilden-Truhe 54 Plätze, mit dieser Mod wird die Kapazität auf 500 Plätze erhöht (konfigurierbar im Skript).

Die Mod basiert auf [UE4SS](https://github.com/UE4SS-RE/RE-UE4SS) (Unreal Engine 4 Server Scripting) und verwendet ein Lua-Skript, um zur Laufzeit auf die Initialisierung der Truhe zuzugreifen und deren Platzangebot zu erweitern.

**Wichtig für Dedicated Server & Singleplayer:**
Die Größe der Gilden-Truhe wird in das Savegame (den Spielstand) geschrieben, sobald die Gilde (und damit die erste Truhe) erstellt wird. Damit die erhöhten Slots auf einem Server oder im Singleplayer greifen, muss die Mod aktiv sein **bevor** die Truhe gebaut/die Gilde gegründet wird, **oder** die Spieler müssen die Gilde verlassen, eine neue Gilde gründen und beitreten (auf einem Server möglich). Auf einem Server greift dies am besten, wenn man eine neue Gilde gründet oder das Spiel mit einem neuen Charakter startet. Einzelspieler müssen ggf. einen neuen Spielstand beginnen. Wenn Truhen bereits existieren, müssen diese unter Umständen abgebaut und neu platziert werden.

## Voraussetzungen

- Ein laufender Palworld Linux Dedicated Server
- Installiertes **UE4SS (Experimental Palworld Fork)** für Linux/Proton. (Beachte, dass UE4SS auf Linux-Servern häufig über Proton oder Wine ausgeführt wird, wenn der Server als Windows-Binary mit Wine/Proton läuft. Wenn es ein nativer Linux-Server ist, muss ein Linux-kompatibler UE4SS-Build verwendet werden oder ein Injection-Tool für Linux).

## Installation

1. Stelle sicher, dass UE4SS auf deinem Server korrekt installiert und konfiguriert ist.
2. Lade diesen Mod-Ordner (`GuildChestMod`) herunter.
3. Kopiere den Ordner `GuildChestMod` in das `Mods`-Verzeichnis deiner UE4SS-Installation auf dem Server.
   Standardpfad (Windows/Proton): `Pal/Binaries/Win64/Mods/`
   Beispiel: `Pal/Binaries/Win64/Mods/GuildChestMod/Scripts/main.lua`
4. Öffne die Datei `mods.txt` im `Mods`-Ordner deines Servers und füge am Ende der Liste folgende Zeile hinzu (oder ändere 0 auf 1, falls schon vorhanden):
   ```text
   GuildChestMod : 1
   ```
5. Speichere die Datei und starte den Palworld Dedicated Server neu.

## Konfiguration

Du kannst die Anzahl der Slots anpassen, indem du die Datei `Scripts/main.lua` öffnest und die Variable `TARGET_SLOTS` änderst:

```lua
local TARGET_SLOTS = 500 -- Ändere diese Zahl für mehr oder weniger Slots
```

## Fehlerbehebung

- **Die Slots bleiben bei 54:** Baue die Gilden-Truhe ab und platziere sie neu. Sollte das nicht helfen, müssen die Spieler ihre aktuelle Gilde auflösen/verlassen und eine neue Gilde gründen (siehe "Wichtig" oben).
- **Mod lädt nicht:** Überprüfe in den UE4SS Logs (`UE4SS.log`), ob das Skript geladen wurde. Suche nach `[Lua] GuildChestMod loading...`. Überprüfe, ob `mods.txt` korrekt editiert wurde.
- **Server stürzt ab:** Möglicherweise gibt es Konflikte mit anderen Mods, die das Inventar verändern, oder die UE4SS-Version ist inkompatibel zum aktuellen Palworld-Update.

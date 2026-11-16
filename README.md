<p align="center">
  <a href="https://github.com/babeinlovexd"><img src="https://raw.githubusercontent.com/babeinlovexd/babeinlovexd/main/bxd-github-header.svg" width="520" alt="BxD / BabeinlovexD"></a>
</p>

# Guild Chest Slot Mod

[Fragen & Fehler](https://github.com/babeinlovexd/Slot-Mod-Palworld/issues)

Eine **experimentelle UE4SS-Lua-Mod für Palworld**, die beim Initialisieren eines Item-Containers dessen Slotanzahl prüft. Container mit **54 Slots** werden auf den konfigurierten Zielwert gesetzt, standardmäßig **500**.

Die Mod ist ein Hobbyprojekt und hat im Einsatz noch gelegentlich Probleme. Der aktuelle Code erkennt Container anhand der Slotanzahl, nicht anhand einer eindeutigen Guild-Chest-Klassenprüfung. Andere Container mit 54 Slots können deshalb ebenfalls betroffen sein.

## Voraussetzungen

- Eine Palworld-Installation, in der ein passender UE4SS-Build bereits erfolgreich Lua-Mods lädt.
- Zugriff auf das UE4SS-Verzeichnis `Mods`.
- Eine Sicherung des Spielstands vor dem Einsatz oder Änderungen an der Mod.

Ein nativer Linux-Server und eine Windows-Serverinstallation unter Wine/Proton sind unterschiedliche Umgebungen. Dieses Repository liefert keinen eigenen UE4SS-Loader oder Nachweis einer universellen Linux-Kompatibilität.

## Installation

1. Den Ordner [GuildChestMod](GuildChestMod) in das `Mods`-Verzeichnis der funktionierenden UE4SS-Installation kopieren.
2. Prüfen, dass `Mods/GuildChestMod/Scripts/main.lua` vorhanden ist.
3. In `mods.txt` aktivieren:

```text
GuildChestMod : 1
```

4. Spiel bzw. Server neu starten und im UE4SS-Log nach `GuildChestMod loading...` und `GuildChestMod loaded.` suchen.

## Konfiguration

In [GuildChestMod/Scripts/main.lua](GuildChestMod/Scripts/main.lua) den Zielwert anpassen:

```lua
local TARGET_SLOTS = 500
```

Die Änderung wird im Hook von `PalMapObjectItemContainerModule:Initialize` versucht: zuerst über `ChangeSlotNum`, dann `UpdateSlotNum`, andernfalls über `SlotNum`. Bereits geladene oder gespeicherte Container werden dadurch nicht zwangsläufig nachträglich umgebaut.

## Fehlersuche

- **Keine Lade-Meldung:** UE4SS-Installation, Verzeichnisstruktur und `mods.txt` prüfen.
- **Mod lädt, Slots bleiben gleich:** Prüfen, ob der betreffende Container beim Hook 54 Slots hat und erneut initialisiert wurde. Fehler im Änderungsblock werden durch `pcall` abgefangen und momentan nicht separat ausgegeben.
- **Probleme nach Spielupdates:** Mod deaktivieren und Spiel-/UE4SS-Version sowie Logauszug im Issue nennen.
- **Bestehende Gilde oder Spielstand:** Nicht allein zur Fehlersuche die Gilde auflösen oder einen Spielstand ersetzen. Änderungen zuerst mit einer Sicherung bzw. Testwelt prüfen.

---

## Builds und Releases

Version: **0.1.0** ([VERSION](VERSION)). [GitHub Actions](.github/workflows/release.yml) prüft Pushes und Pull Requests. Ein Tag passend zu `v` + `VERSION` veröffentlicht das Release erst nach erfolgreichen Jobs; manuelle Läufe liefern Build-Artefakte. [Downloads](https://github.com/babeinlovexd/Slot-Mod-Palworld/releases).

## Mitmachen

Fragen, Fehlerberichte und Beiträge sind willkommen. Nenne bei einem [Issue](https://github.com/babeinlovexd/Slot-Mod-Palworld/issues) bitte Version, Aufbau und Schritte zum Nachstellen. Größere Änderungen besprechen wir am besten vor einem Pull Request.

[BxD / BabeinlovexD](https://github.com/babeinlovexd) · [Website](https://babeinlovexd.de/)

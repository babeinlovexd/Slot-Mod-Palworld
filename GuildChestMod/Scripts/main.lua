local ModName = "GuildChestMod"
local TARGET_SLOTS = 500

print(ModName .. " loading...")

-- Diese Mod nutzt einen Hook beim Initialisieren von Item-Containern.
-- UE4SS reicht das aufrufende Objekt (Context) als erstes Argument in RegisterHook.

RegisterHook("/Script/Pal.PalMapObjectItemContainerModule:Initialize", function(Context, InitData)
    local module = Context
    if not module or not module:IsValid() then return end

    -- pcall fängt mögliche Fehler ab, um Abstürze der Lua-Engine zu vermeiden,
    -- falls Eigenschaften in zukünftigen Updates umbenannt werden.
    pcall(function()
        local container = module.ItemContainer
        if container and container:IsValid() then
            -- Die Gilden-Truhe hat standardmäßig 54 Slots.
            -- Wir prüfen dies, um nicht versehentlich alle Truhen zu verändern.
            if container.SlotNum == 54 then
                print(ModName .. ": Gilden-Truhe gefunden. Erhoehe Slots auf " .. tostring(TARGET_SLOTS))

                -- Wir versuchen bekannte C++ Funktionen zum Ändern der Array-Größe aufzurufen.
                if container.ChangeSlotNum then
                    container:ChangeSlotNum(TARGET_SLOTS)
                elseif container.UpdateSlotNum then
                    container:UpdateSlotNum(TARGET_SLOTS)
                else
                    -- Fallback: Überschreiben des Wertes, wenn die Funktion nicht exponiert ist.
                    container.SlotNum = TARGET_SLOTS
                end
                print(ModName .. ": Slots erfolgreich angepasst.")
            end
        end
    end)
end)

print(ModName .. " loaded.")

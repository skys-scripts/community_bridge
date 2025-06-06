loadedModules = {}

function Require(modulePath, resourceName)
    if resourceName and type(resourceName) ~= "string" then
        resourceName = GetCurrentResourceName()
    end

    if not resourceName then
        resourceName = "community_bridge"
    end

    local id = resourceName .. ":" .. modulePath
    if loadedModules[id] then
        if BridgeSharedConfig.DebugLevel ~= 0 then
            print("^2 Returning cached module [" .. id .. "] ^0")
        end
        return loadedModules[id]
    end

    local file = LoadResourceFile(resourceName, modulePath)
    if not file then
        error("Error loading file [" .. id .. "]")
    end

    local chunk, loadErr = load(file, id)
    if not chunk then
        error("Error wrapping module [" .. id .. "] Message: " .. loadErr)
    end

    local success, result = pcall(chunk)
    if not success then
        error("Error executing module [" .. id .. "] Message: " .. result)
    end
    loadedModules[id] = result
    return result
end

cLib = {
    Require = Require,
    Callback = Callback or Require("lib/utility/shared/callbacks.lua"),
    Ids = Ids or Require("lib/utility/shared/ids.lua"),
    ReboundEntities = ReboundEntities or Require("lib/utility/shared/rebound_entities.lua"),
    Tables = Tables or Require("lib/utility/shared/tables.lua"),
    Prints = Prints or Require("lib/utility/shared/prints.lua"),
    Math = Math or Require("lib/utility/shared/math.lua"),
    LA = LA or Require("lib/utility/shared/la.lua"),
    Perlin = Perlin or Require("lib/utility/shared/perlin.lua"),
    -- Actions = Actions or Require("lib/shared/actions.lua"),
}

exports('cLib', cLib)

if not IsDuplicityVersion() then goto client end

cLib.SQL = SQL or Require("lib/sql/server/sqlHandler.lua")
cLib.Logs = Logs or Require("lib/logs/server/logs.lua")
cLib.ItemsBuilder = ItemsBuilder or Require("lib/generators/server/ItemsBuilder.lua")
cLib.LootTables = LootTables or Require("lib/generators/server/lootTables.lua")

if IsDuplicityVersion() then return cLib end
::client::

cLib.Gizmo = Gizmo or Require("lib/placers/client/gizmo.lua")
cLib.Scaleform = Scaleform or Require("lib/scaleform/client/scaleform.lua")
cLib.Placeable = Placeable or Require("lib/placers/client/object_placer.lua")
cLib.Utility = Utility or Require("lib/utility/client/utility.lua")
cLib.PlaceableObject = PlaceableObject or Require("lib/placers/client/placeable_object.lua")
cLib.Raycast = Raycast or Require("lib/raycast/client/raycast.lua")
cLib.Point = Point or Require("lib/points/client/points.lua")
cLib.Particle = Particle or Require("lib/particles/client/particles.lua")
cLib.Object = Object or Require("lib/entities/client/entity_object.lua")

return cLib
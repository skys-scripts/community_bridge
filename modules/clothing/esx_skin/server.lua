if GetResourceState('esx_skin') ~= 'started' then return end

RegisterNetEvent("esx_skin:save", function(skin)
    local src = source
    TriggerClientEvent('community_bridge:client:updateStoredClothing', src, skin)
end)

Clothing = Clothing or {}

Clothing.SetAppearance = function(src, data)
    --wip
end

Clothing.GetAppearance = function(src)
    --wip
end

Clothing.RestoreAppearance = function(src)
    --wip
end

Clothing.ReloadSkin = function(src)
    --wip
end
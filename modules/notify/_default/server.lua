Notify = Notify or {}

---This will send a notification to the specified player of the passed message and type
---@param src number
---@param message string
---@param _type string
---@param time number
Notify.SendNotify = function(src, message, _type, time)
    TriggerClientEvent('community_bridge:Client:Notify', src, message, _type, time)
end

---This will show a help text message to the specified player at the screen position passed
---@param src number
---@param message string
---@param position string
Notify.ShowHelpText = function(src, message, position)
    TriggerClientEvent('community_bridge:Client:ShowHelpText', src, message, position)
end

---This will hide the help text message on the screen for the specified player
---@param src number
Notify.HideHelpText = function(src)
    TriggerClientEvent('community_bridge:Client:HideHelpText', src)
end
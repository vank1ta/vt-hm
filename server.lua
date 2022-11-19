local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("hm", "Spawn Motorcycles", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
            TriggerClientEvent('vt-hm:client:taken', src)
    end
end)
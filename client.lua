local QBCore = exports['qb-core']:GetCoreObject()
local taken = false

RegisterNetEvent('vt-hm:client:taken')
AddEventHandler('vt-hm:client:taken', function()
  if not taken then
    local vehicle = GetHashKey('diablous2')
    QBCore.Functions.Notify(Config.Lang.notify.rent, "info")
    local coords = GetEntityCoords(PlayerPedId())
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "VT DEV"..tostring(math.random(1000, 9999)))
        exports['vt-fuel']:SetFuel(veh, 100.0)
        SetEntityHeading(veh, coords.h)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        taken = true
        print('cooldown start')
    end, coords, true)
  elseif taken then
    QBCore.Functions.Notify(Config.Lang.notify.time, "error")
    Wait(600000)
    print('cooldown stop')
    taken = false
  end
end)
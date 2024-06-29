QBCore = nil
local PlayerData = {}
Citizen.CreateThread(function() 
    while QBCore == nil do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
        Citizen.Wait(200)
    end
end)
local QBCore = exports['qb-core']:GetCoreObject()
local Venus = Config.Emlak

CreateThread(function()
    for k, v in pairs(Venus) do
        RequestModel(v.Ped.pedmodel)
        while not HasModelLoaded(v.Ped.pedmodel) do
            Wait(1)
        end
    
        local sellerPed = CreatePed(4, v.Ped.pedmodel, v.Ped.kord.x, v.Ped.kord.y, v.Ped.kord.z - 1.0, v.Ped.kord.w, false, true)
        FreezeEntityPosition(sellerPed, true)
        SetEntityInvincible(sellerPed, true)
        SetBlockingOfNonTemporaryEvents(sellerPed, true)

        for i,z in pairs(v.Meslek) do
            exports['qb-target']:AddTargetEntity(sellerPed, {
                options = {
                    {
                        icon = Config.Targeticon,
                        label = Config.TargetYazi,
                        action = function()
                            TriggerServerEvent("venus-emlak:server:karapara", QBCore.Key)
                        end,
                        canInteract = function()
                            if z == QBCore.Functions.GetPlayerData().job.name then
                                return true
                            end

                            return false
                        end,
                    },
                },
                distance = Config.Mesafe
            })
        end
    end
end)

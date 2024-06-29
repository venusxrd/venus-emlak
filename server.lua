local QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('venus-emlak:server:karapara', function(key)
    local Player = QBCore.Functions.GetPlayer(source)
		if Player ~= nil then
			if Player.Functions.GetItemByName('karapara').amount >= Config.Minkarapara then
				TriggerClientEvent("QBCore:Notify", source, Player.Functions.GetItemByName('karapara').amount * 100 / 100 .. "$ kara para akladın")
				Player.Functions.AddMoney('cash', Player.Functions.GetItemByName('karapara').amount * 100 / 100)
				Player.Functions.RemoveItem('karapara', Player.Functions.GetItemByName('karapara').amount)				
			else
				TriggerClientEvent("QBCore:Notify", source, Config.Karaparabildirim, "error")
			end
		end
end)

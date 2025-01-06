local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('taser_ammo', function(source)
	local source = source
	local xPlayer  = QBCore.Functions.GetPlayer(source)
	
    TriggerClientEvent("frrp-taser", source)
end)

RegisterNetEvent("frrp-cartcheck")
AddEventHandler("frrp-cartcheck", function()
	local source = source
	local xPlayer  = QBCore.Functions.GetPlayer(source)

	xPlayer.Functions.RemoveItem('taser_ammo', 1)
end)

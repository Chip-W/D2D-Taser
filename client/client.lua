-- Original resource by D2D - https://github.com/DareToDoyle/D2D-Taser

MaxAmmo = Config.Cartridges -- The amount of taser cartridges a person can have.

local ShotsRemaining = MaxAmmo


RegisterNetEvent("frrp-taser")
AddEventHandler("frrp-taser", function()
	if ShotsRemaining <= 0 then
    lib.notify({
        title = 'AXON Taser',
        description = 'Refilling Taser - Please Wait'..Config.ReloadTime..'seconds.',
        duration = 5000,
        type = 'warning',
    })
	TriggerServerEvent("d2d-cartcheck") -- Only uses item if you have 0 cartridges.
    
	Citizen.Wait(Config.ReloadTime * 1000)
    
	ShotsRemaining = MaxAmmo
    lib.notify({
        title = 'AXON Taser',
        description = 'Taser Cartridges Refilled',
        type = 'inform',
    })
	else
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local taserModel = GetHashKey(Config.Stungun)

        if Config.CustomTime == true then
            SetPedMinGroundTimeForStungun(ped, Config.Time * 1000)
        end

        if GetSelectedPedWeapon(ped) == taserModel then
            if IsPedShooting(ped) then
                ShotsRemaining = ShotsRemaining - 1
                lib.notify({
                    title = 'AXON Taser',
                    description = 'you have '..ShotsRemaining..' cartridge(s) left',
                    type = 'inform',
                })
            end
        end

        if ShotsRemaining <= 0 then -- Stops player from firing.
            if GetSelectedPedWeapon(ped) == taserModel then
                SetPlayerCanDoDriveBy(ped, false)
                DisablePlayerFiring(ped, true)
            else
            end
        end
    end
end)

Citizen.CreateThread(function() -- Reload Notification
    while true do
       Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local taserModel = GetHashKey("WEAPON_STUNGUN")

        if ShotsRemaining <= 0 then
            if GetSelectedPedWeapon(ped) == taserModel and IsControlJustReleased(0, 106) then
                lib.notify({
                    title = 'AXON Taser',
                    description = 'Reload your taser',
                    type = 'error',
                })
				Citizen.Wait(5000)
            end
        else
        end
    end
end)

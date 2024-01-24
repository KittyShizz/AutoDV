RegisterNetEvent('clearallvehicles', function()
    ClearAreaOfVehicles(0.0, 0.0, 0.0, 500000.0, false, false, false, false, false)
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, true)

        if DoesEntityExist(veh) then
            if IsVehicleSeatFree(veh, -1) and IsVehicleSeatFree(veh, -2) and IsVehicleSeatFree(veh, -3) and IsVehicleSeatFree(veh, -4) then
                SetEntityAsNoLongerNeeded(veh)
            end
        end

        Wait(3000)
    end
end)

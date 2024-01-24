QBCore = exports['qb-core']:GetCoreObject()


local function sendAutoDVAlert(message, time)
    --TriggerClientEvent('okokNotify:Alert', -1, "Auto DV", message, 3000, 'warning')
    TriggerClientEvent('QBCore:Notify', -1, message, 'error', 3000)

    Citizen.Wait(time)
end

local function sendAdminAutoDVAlert(message, time)
    --TriggerClientEvent('okokNotify:Alert', -1, "Admin Auto DV", message, 3000, 'warning')
    TriggerClientEvent('QBCore:Notify', -1, message, 'error', 3000)

    Citizen.Wait(time)
end

local function countdownAlert(minutes)
    for i = minutes, 1, -1 do
        local alertMessage = string.format("🚗 All Vehicles Will Be Cleared in %d Minute%s... 🚗", i, i > 1 and "s" or "")
        sendAutoDVAlert(alertMessage, 60000)
        print(alertMessage)
    end
end

local function clearAllVehicles()
    local currentTime = os.date("%I:%M:%S %p")
    local message = string.format("All Vehicles Cleared at %s!", currentTime)

    sendAutoDVAlert(message, 0)
    TriggerClientEvent("clearallvehicles", -1)
    print(message)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10800000)  -- Wait for 3 hours

        countdownAlert(5)
        clearAllVehicles()
    end
end)

RegisterCommand('dvauto', function()
    countdownAlert(5)
    clearAllVehicles()
end, false)

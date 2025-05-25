

local isNuiReady = false


CreateThread(function()
    while not isNuiReady do
        Wait(100)
    end
end)


RegisterNUICallback('nuiReady', function(data, cb)
    isNuiReady = true
    cb('ok')
end)


function ShowNotification(message, type, duration)
    if not isNuiReady then
        return
    end

    local notifType = type or 'info'
    local notifDuration = duration or 5000

    SendNUIMessage({
        action = 'showNotification',
        message = message,
        type = notifType,
        duration = notifDuration
    })
end


exports('ShowNotification', ShowNotification)


exports('notify', ShowNotification)


exports('showSuccess', function(message, duration)
    ShowNotification(message, 'success', duration)
end)


exports('showError', function(message, duration)
    ShowNotification(message, 'error', duration)
end)


exports('showWarning', function(message, duration)
    ShowNotification(message, 'warning', duration)
end)


exports('showInfo', function(message, duration)
    ShowNotification(message, 'info', duration)
end)


RegisterNetEvent('custom-notifications:client:notify', function(message, type, duration)
    ShowNotification(message, type, duration)
end)


RegisterNetEvent('esx:showNotification', function(message, type, duration)
    ShowNotification(message, type, duration)
end)



RegisterCommand('testnotify', function()
    CreateThread(function()
        ShowNotification('This is a success notification!', 'success', 5000)
        Wait(1000)
        ShowNotification('This is an error notification!', 'error', 5000)
        Wait(1000)
        ShowNotification('This is a warning notification!', 'warning', 5000)
        Wait(1000)
        ShowNotification('This is an info notification!', 'info', 5000)
        Wait(1000)
        ShowNotification('Testing with longer duration', 'success', 8000)
        Wait(1000)
        ShowNotification('Testing with shorter duration', 'error', 2000)
    end)
end, false)


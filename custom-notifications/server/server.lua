
function NotifyPlayer(playerId, message, type, duration)
    if not playerId or not message then
        return
    end

    local notifType = type or 'info'
    local notifDuration = duration or 5000

    TriggerClientEvent('custom-notifications:client:notify', playerId, message, notifType, notifDuration)
end


function NotifyAll(message, type, duration)
    if not message then
        return
    end

    local notifType = type or 'info'
    local notifDuration = duration or 5000

    TriggerClientEvent('custom-notifications:client:notify', -1, message, notifType, notifDuration)
end


exports('NotifyPlayer', NotifyPlayer)
exports('NotifyAll', NotifyAll)


exports('notify', NotifyPlayer)
exports('notifyAll', NotifyAll)


exports('notifySuccess', function(playerId, message, duration)
    NotifyPlayer(playerId, message, 'success', duration)
end)

exports('notifyError', function(playerId, message, duration)
    NotifyPlayer(playerId, message, 'error', duration)
end)

exports('notifyWarning', function(playerId, message, duration)
    NotifyPlayer(playerId, message, 'warning', duration)
end)

exports('notifyInfo', function(playerId, message, duration)
    NotifyPlayer(playerId, message, 'info', duration)
end)


RegisterServerEvent('custom-notifications:server:notify')
AddEventHandler('custom-notifications:server:notify', function(target, message, type, duration)
    local source = source

    if not target or not message then
        return
    end

    if target == -1 or target == 'all' then
        NotifyAll(message, type, duration)
    else
        NotifyPlayer(target, message, type, duration)
    end
end)


if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()


    function ESX.ShowNotification(message, type, duration)
        NotifyAll(message, type, duration)
    end
end


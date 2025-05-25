# custom_notifications

# Custom Notifications

## Basic Usage

```lua
-- General notification  client function
exports['custom-notifications']:ShowNotification('Message', 'success', 5000)
exports['custom-notifications']:ShowNotification('Message', 'info', 5000)
exports['custom-notifications']:ShowNotification('Message', 'error', 5000)
exports['custom-notifications']:ShowNotification('Message', 'success', 5000)


-- General notification  server function
TriggerEvent('custom-notifications:client:notify', 'Message', 'success', 3000)
TriggerEvent('custom-notifications:client:notify', 'Message', 'info', 3000)
TriggerEvent('custom-notifications:client:notify', 'Message', 'success', 3000)
TriggerEvent('custom-notifications:client:notify', 'Message', 'error', 3000)


### Test Command
```
/testnotify
```
This command will show all notification types (success, error, warning, info) with differen

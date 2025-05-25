# Custom Notifications


Preview

![{8F3E3F71-9E8B-4986-ACFA-4D09F568BE12}](https://github.com/user-attachments/assets/cd7950e0-f276-46e5-baf5-1cc09c9cbd95)


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

/testnotify

This command will show all notification types (success, error, warning, info)

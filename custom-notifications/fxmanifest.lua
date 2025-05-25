fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'Custom Notifications for ESX Legacy'
version '1.0.1'

shared_scripts {
    '@es_extended/imports.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependencies {
    'es_extended'
}

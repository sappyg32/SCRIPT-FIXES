fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'sd-phone-vendor'
author 'you'
version '1.0.0'
description 'Phone Salesman NPC at Legion Square - sells sd-phone handsets and SIM cards'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
}

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

dependencies {
    'ox_lib',
    'es_extended',
    'sd-phone',
}

provide 'sd-phone-vendor'

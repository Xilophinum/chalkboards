fx_version 'cerulean'
game 'gta5'
lua54 'yes'

ui_page 'web/dist/index.html'

files {
    'web/dist/index.html',
    'web/dist/**/**',
    'web/dist/assets/**',
    'web/dist/assets/*.css',
    'web/dist/assets/*.js',
    'web/dist/assets/*.ttf',
    'web/dist/assets/*.woff',
    'web/dist/assets/*.woff2',
}

shared_scripts {
    '@ox_lib/init.lua',
    'lua/sh_*.lua'
}

client_scripts {
    'lua/cl_*.lua'
}

server_scripts {
    'lua/sv_*.lua'
}
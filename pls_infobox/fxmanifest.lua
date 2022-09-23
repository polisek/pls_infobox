fx_version 'adamant'
lua54 'yes'

games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'Polísek - Infobox'

ui_page "html/index.html"

client_script {
	'client/client.lua',
}


shared_scripts { 
	'config.lua',
}

files {
    'html/index.html',
    'html/assets/script/script.js',
    'html/assets/css/main.css', 
    'html/assets/image/paper.jpg', 
}

export "openInfobox"
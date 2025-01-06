# First Response RP Taser
Taser System for FiveM / QBCore

This is a QBCore conversion of D2D Taser - https://github.com/DareToDoyle/D2D-Taser

1) Copy this item to your qb-core/shared/items.lua
```
taser_ammo = { name = 'taser_ammo', label = 'Taser Cartridge', weight = 200, type = 'item', image = 'taser_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Taser Cartridge' },
```
2) Copy this to your qb-weapons/config.lua (Config.AmmoTypes section)
```
taser_ammo = { ammoType = 'AMMO_STUNGUN', amount = 2 },
```
3) Add the included taser_ammo.png to your inventory images folder

4) Put "ensure frrp_taser" in your server.cfg

5) Start your server and enjoy!

-----------
REQUIREMENTS
-----------
This resource requires ox_lib

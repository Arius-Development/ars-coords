local round = function(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 2) 
	return math.floor(num * mult + 0.5) / mult
end

lib.registerMenu({
    id = 'coords_menu',
    title = 'Copy Coords',
    position = 'top-right',
    options = {}
}, function(selected, scrollIndex, args)
    lib.setClipboard(args[scrollIndex])
    print(args[scrollIndex])
end)

RegisterCommand('coords', function()
    local entityCoords = GetEntityCoords(cache.ped)
    local entityHeading = GetEntityHeading(cache.ped)
    local data = { 
        round(entityCoords.x)..", "..round(entityCoords.y)..", "..round(entityCoords.z), 
        round(entityCoords.x).." "..round(entityCoords.y).." "..round(entityCoords.z), 
        "{"..round(entityCoords.x)..", "..round(entityCoords.y)..", "..round(entityCoords.z).."}", 
        "x = "..round(entityCoords.x)..", y = "..round(entityCoords.y)..", z = "..round(entityCoords.z), 
        "vector3("..round(entityCoords.x)..", "..round(entityCoords.y)..", "..round(entityCoords.z)..")", 
        "vector4("..round(entityCoords.x)..", "..round(entityCoords.y)..", "..round(entityCoords.z)..", "..round(entityHeading)..")", 
        round(GetEntityHeading(cache.ped))
    }

    local options = {
        {
            label = 'Copy Coords', 
            icon = 'location-dot', 
            values = data,
            args = data
        },
    }

    lib.setMenuOptions('coords_menu', options)
    lib.showMenu('coords_menu')
end)
local coords 

RegisterCommand('coords', function()
    local entityCoords = GetEntityCoords(cache.ped)
    local entityHeading = GetEntityHeading(cache.ped)
    lib.registerMenu({
        id = 'coords_menu',
        title = 'Copy Coords',
        position = 'top-right',
        onSideScroll = function(selected, scrollIndex, args)
            if scrollIndex == 1 then
                coords = math.ceil(entityCoords.x)..", "..math.ceil(entityCoords.y)..", "..math.ceil(entityCoords.z)
            elseif scrollIndex == 2 then
                coords = math.ceil(entityCoords.x).." "..math.ceil(entityCoords.y).." "..math.ceil(entityCoords.z)
            elseif scrollIndex == 3 then
                coords = "{"..math.ceil(entityCoords.x)..", "..math.ceil(entityCoords.y)..", "..math.ceil(entityCoords.z).."}"
            elseif scrollIndex == 4 then
                coords = "x = "..math.ceil(entityCoords.x)..", y = "..math.ceil(entityCoords.y)..", z = "..math.ceil(entityCoords.z)
            elseif scrollIndex == 5 then
                coords = "vector3("..math.ceil(entityCoords.x)..", "..math.ceil(entityCoords.y)..", "..math.ceil(entityCoords.z)..")"
            elseif scrollIndex == 6 then
                coords = "vector4("..math.ceil(entityCoords.x)..", "..math.ceil(entityCoords.y)..", "..math.ceil(entityCoords.z)..", "..math.ceil(entityHeading)..")"
            elseif scrollIndex == 7 then
                coords = math.ceil(GetEntityHeading(cache.ped))
            end
        end,
        options = {
            {label = 'Copy Coords', icon = 'location-dot', values={math.ceil(entityCoords.x)..", "..math.ceil(entityCoords.y)..", "..math.ceil(entityCoords.z), math.ceil(entityCoords.x).." "..math.ceil(entityCoords.y).." "..math.ceil(entityCoords.z), "{"..math.ceil(entityCoords.x)..", "..math.ceil(entityCoords.y)..", "..math.ceil(entityCoords.z).."}", "x = "..math.ceil(entityCoords.x)..", y = "..math.ceil(entityCoords.y)..", z = "..math.ceil(entityCoords.z), "vector3("..math.ceil(entityCoords.x)..", "..math.ceil(entityCoords.y)..", "..math.ceil(entityCoords.z)..")", "vector4("..math.ceil(entityCoords.x)..", "..math.ceil(entityCoords.y)..", "..math.ceil(entityCoords.z)..", "..math.ceil(entityHeading)..")", math.ceil(GetEntityHeading(cache.ped))}},
        }
    }, function(selected, scrollIndex, args)
        lib.setClipboard(coords)
        print(coords)
    end)

    lib.showMenu('coords_menu')
end)

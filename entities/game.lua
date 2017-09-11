-- Entity: game
-- Entity Description: The root object of the game state

return function()
    return {
        screen = nil,
        screenX = 0,
        screenY = 0,
        screens = {}
    }
end
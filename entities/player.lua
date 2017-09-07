-- Entity: player
-- Entity Description: A player character

return function()
    return {
        position = {0, 0},
        velocity = {0, 0},
        boundingBox = {-3, -5, 3, 5}
    }
end
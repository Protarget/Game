local screenEntity = require("entities/screen")

-- System: update/transition
-- System Description: Cause a player to transition between screens when touching a border

-- Function: Check if the player is off the borders of a screen
--           And if they are, then load the appropriate next screen
-- Arguments:
--  game (game): The game object
return function(game)
    local sx, sy = game.screenX, game.screenY
    local px, py = game.screen.player.position[1], game.screen.player.position[2]
    if (px < 0) then
        sx = sx - 1
        px = px + 96
    elseif (px > 96) then
        sx = sx + 1
        px = px - 96
    elseif (py < 0) then
        sy = sy - 1
        py = py + 96
    elseif (py > 96) then
        sy = sy + 1
        py = py - 96
    else
        return false
    end

    local player = game.screen.player
    game.screen.player = nil
    local newScreen = game.screens[sx .. "," .. sy]
    if (newScreen) then
        game.screen = newScreen
    else
        game.screen = screenEntity()
    end
    game.screenX = sx
    game.screenY = sy
    game.screen.player = player
    player.position = {px, py}
end
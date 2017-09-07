-- System: update/update
-- System Description: Update an entire game

local screenUpdate = require("systems/update/screen")

-- Function: Apply updates to a game
-- Arguments:
--  game (game): The game to apply updates to
--  dt (number): The delta-time for this frame
return function(game, dt)
    screenUpdate(game.screen, dt)
end
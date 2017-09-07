-- System: render/debug
-- Entity Description: Render a debug display for the whole game

local screen = require("systems/render/debug/screen")

return function(game)
    screen(game.screen)
end
-- System: render/debug/screen
-- System Description: Render a debug display for a screen

local playerRender = require("systems/render/debug/player")
local rectangleRender = require("systems/render/debug/rectangle")

return function(screen)
    love.graphics.setColor(255, 0, 0, 255)
    for key, collision in ipairs(screen.staticCollision) do
        rectangleRender(collision)
    end
    love.graphics.setColor(255, 255, 0, 255)
    for key, collision in ipairs(screen.ladders) do
        rectangleRender(collision)
    end
    love.graphics.setColor(0, 255, 0, 255)
    playerRender(screen.player)
end
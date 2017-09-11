-- System: render/scaled
-- System Description: Wrap the game rendering in order to scale it appropriately

local rawBuffer = nil
local debug = require("systems/render/debug")

return function(width, height, scaleFactor, game)
    if (rawBuffer == nil) then
        rawBuffer = love.graphics.newCanvas(width, height)
    end
    love.graphics.setCanvas(rawBuffer)
    love.graphics.clear()
    debug(game)
    love.graphics.setCanvas()
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(rawBuffer, 0, 0, 0, scaleFactor, scaleFactor)
end
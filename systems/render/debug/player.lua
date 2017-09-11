-- System: render/debug/player
-- System Description: Render a debug display of the bounding box of a player

local rectangle = require("utilities/rectangle")
local rectangleRender = require("systems/render/debug/rectangle")

return function(player)
    rectangleRender(rectangle.offset(player.boundingBox, player.position))
end
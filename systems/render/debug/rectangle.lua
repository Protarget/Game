-- System: render/debug/rectangle
-- Entity Description: Render a debug display for a rectangle

local rectangle = require("utilities/rectangle")

return function(r)
    local x = r[1]
    local y = r[2]
    local w = rectangle.width(r)
    local h = rectangle.height(r)
    love.graphics.rectangle("line", x, y, w - 1, h - 1)
end
-- System: update/screen/physics/staticCollision
-- System Description: Perform static collision and response for an entity

local rectangle = require("utilities/rectangle")
local vector = require("utilities/vector")

-- Function: Resolve collisions of an object with a position and a boundingBox
--           against a list of collision rectangles
-- Arguments:
--  box (rect): The bounding box to check against static geometry
--  offset (vector): How much to offset the bounding box by
--  collision ({rectangle}): The list of static rectangles to check collision against
-- Returns:
--  1 (boolean): Whether or not the box overlaps with anything
return function(box, offset, collision)
    local bbox = rectangle.offset(box, offset)
    for index, collision in ipairs(collision) do
        if (rectangle.overlaps(collision, bbox)) then
            return true
        end
    end
    return false
end
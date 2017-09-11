-- System: update/screen/physics/staticCollision
-- System Description: Perform static collision and response for an entity

local rectangle = require("utilities/rectangle")
local vector = require("utilities/vector")

-- Function: Resolve collisions of an object with a position and a boundingBox
--           against a list of collision rectangles
-- Arguments:
--  object (has: velocity, has: boundingBox): The object to check collisions for and resolve
--  collision ({rectangle}): The list of static rectangles to check collision against
--  dt (number): The delta-time for this frame
-- Returns:
--  1 (boolean): Whether or not the object collided with anything
--  2 (vector): The expulsion vector for the collision
return function(object, collision, dt, noResponse)
    local bbox = rectangle.offset(object.boundingBox, object.position)
    for index, collision in ipairs(collision) do
        if (rectangle.overlaps(collision, bbox)) then
            if (noResponse) then return true, {0, 0} end
            local expulsion = rectangle.expel(collision, bbox)
            object.position = vector.add(object.position, expulsion)
            return true, expulsion
        end
    end
    return false, {0, 0}
end
-- System: update/screen/physics/gravity
-- System Description: Apply gravity to an object with velocity

local GRAVITY = 90

-- Function: Apply gravity to an object with velocity
-- Arguments:
--  object (has: velocity): The object with a velocity to apply gravity to
--  dt (number): The delta-time for this frame
return function(object, dt)
    object.velocity[2] = object.velocity[2] + GRAVITY * dt
end
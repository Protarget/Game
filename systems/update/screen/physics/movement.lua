-- System: update/screen/physics/movement
-- System Description: Apply movement to an object with velocity and position

-- Function: Apply movement to an object on an axis, adding velocity to position
-- Arguments:
--  object (has: velocity, has: position): The object with a position and velocity to apply movement to
--  index (number): The axis index, 1 for x or 2 for y
--  dt (number): The delta-time for this frame
return function(object, index, dt)
    object.position[index] = object.position[index] + object.velocity[index] * dt
end
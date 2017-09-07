-- System: update/screen/physics
-- System Description: Perform screen physics

local movement = require("systems/update/screen/physics/movement")
local staticCollision = require("systems/update/screen/physics/staticCollision")
local gravity = require("systems/update/screen/physics/gravity")

-- Function: Apply physics to a screen's player
-- Arguments:
--  screen (screen): The screen to apply physics to
--  dt (number): The delta-time for this frame
function playerUpdate(screen, dt)
    movement(screen.player, 1, dt)
    local xCollide, xVector = staticCollision(screen.player, screen.staticCollision, dt)

    movement(screen.player, 2, dt)
    local yCollide, yVector = staticCollision(screen.player, screen.staticCollision, dt)

    if ((xVector[1] ~= 0 or yVector[1] ~= 0) and xCollide) then
        screen.player.velocity[1] = 0
    end

    if ((xVector[2] < 0 or yVector[2] < 0) and yCollide) then
        screen.player.velocity[2] = 0
        screen.player.grounded = true
    else
        screen.player.grounded = nil
    end

    gravity(screen.player, dt)
end

-- Function: Apply physics to a screen
-- Arguments:
--  screen (screen): The screen to apply physics to
--  dt (number): The delta-time for this frame
return function(screen, dt)
    playerUpdate(screen, dt)
end
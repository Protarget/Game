-- System: update/screen/physics
-- System Description: Perform screen physics

local movement = require("systems/update/screen/physics/movement")
local staticCollision = require("systems/update/screen/physics/staticCollision")
local staticBoxTest = require("systems/update/screen/physics/staticBoxTest")
local gravity = require("systems/update/screen/physics/gravity")

-- Function: Apply the player's movement and collision, but not anything else
-- Arguments:
--  screen (screen): The screen to apply physics to
--  dt (number): The delta-time for this frame
function applyPlayerMovementAndCollision(screen, dt)
    movement(screen.player, 1, dt)
    local xCollide, xVector = staticCollision(screen.player, screen.staticCollision, dt)

    movement(screen.player, 2, dt)
    local yCollide, yVector = staticCollision(screen.player, screen.staticCollision, dt)

    return xCollide, xVector, yCollide, yVector
end

-- Function: Apply standard platformer physics to a screen's player
-- Arguments:
--  screen (screen): The screen to apply physics to
--  dt (number): The delta-time for this frame
function playerUpdateStandard(screen, dt)
    local xCollide, xVector, yCollide, yVector = applyPlayerMovementAndCollision(screen, dt)

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

    screen.player.touchingLadder = staticCollision(screen.player, screen.ladders, dt, true)

    if (screen.player.crouching) then
        screen.player.canStand = not staticBoxTest(screen.player.standingBox, screen.player.position, screen.staticCollision)
    end
end

-- Function: Apply ladder physics to a screen's player
-- Arguments:
--  screen (screen): The screen to apply physics to
--  dt (number): The delta-time for this frame
function playerUpdateLadder(screen, dt)
    local xCollide, xVector, yCollide, yVector = applyPlayerMovementAndCollision(screen, dt)
    screen.player.grounded = nil

    screen.player.touchingLadder = staticCollision(screen.player, screen.ladders, dt, true)
    if (not screen.player.touchingLadder) then
        screen.player.onLadder = false
    end
end

-- Function: Apply all physics to player
-- Arguments:
--  screen (screen): The screen to apply physics to
--  dt (number): The delta-time for this frame
function playerUpdate(screen, dt)
    if (screen.player.onLadder) then
        playerUpdateLadder(screen, dt)
    else
        playerUpdateStandard(screen, dt)
    end
end

-- Function: Apply physics to a screen
-- Arguments:
--  screen (screen): The screen to apply physics to
--  dt (number): The delta-time for this frame
return function(screen, dt)
    playerUpdate(screen, dt)
end
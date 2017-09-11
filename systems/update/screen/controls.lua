-- System: update/screen/controls
-- System Description: Perform player controls

require("utilities/math")

function ladderControls(screen, dt)
    local vx = 0
    local vy = 0
    if (love.keyboard.isDown("w")) then
        vy = vy - 20
    end
    
    if (love.keyboard.isDown("s")) then
        vy = vy + 20
    end

    if (love.keyboard.isDown("a")) then
        vx = vx - 20
    end
    
    if (love.keyboard.isDown("d")) then
        vx = vx + 20
    end

    screen.player.velocity = {vx, vy}
end

function standardControls(screen, dt)
    local vx = 0

    if (love.keyboard.isDown("a")) then
        vx = vx - 900
    end

    if (love.keyboard.isDown("d")) then
        vx = vx + 900
    end

    if (love.keyboard.isDown("w") and screen.player.grounded) then
        screen.player.velocity[2] = -40
        screen.player.grounded = nil
    end

    if (love.keyboard.isDown("w") and screen.player.touchingLadder) then
        screen.player.onLadder = true
    end

    if (not screen.player.grounded) then
        vx = vx * 0.025
    end

    if (vx == 0 and screen.player.grounded) then
        screen.player.velocity[1] = math.decay(screen.player.velocity[1], 75 * dt)
    else
        screen.player.velocity[1] = screen.player.velocity[1] + vx * dt
        screen.player.velocity[1] = math.clampSigned(screen.player.velocity[1], 17)
    end
end

-- Function: Apply player controls to a screen
-- Arguments:
--  screen (screen): The screen to apply player controls to
--  dt (number): The delta-time for this frame
return function(screen, dt)
    if (screen.player.onLadder) then
        ladderControls(screen, dt)
    else
        standardControls(screen, dt)
    end
end
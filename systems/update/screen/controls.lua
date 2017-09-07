-- System: update/screen/controls
-- System Description: Perform player controls

require("utilities/math")

-- Function: Apply player controls to a screen
-- Arguments:
--  screen (screen): The screen to apply player controls to
--  dt (number): The delta-time for this frame
return function(screen, dt)
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
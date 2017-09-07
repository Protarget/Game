-- System: update/screen
-- System Description: Update an entire screen

local controls = require("systems/update/screen/controls")
local physics = require("systems/update/screen/physics")

-- Function: Apply updates to a screen
-- Arguments:
--  screen (screen): The screen to apply updates to
--  dt (number): The delta-time for this frame
return function(screen, dt)
    controls(screen, dt)
    physics(screen, dt)
end
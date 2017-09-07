-- Function: Take the sign of a number
-- Arguments:
--  x (number): The number to take the sign of
-- Returns:
--  1 (number): The sign of the number (-1 for negative, 0 for 0, 1 for positive)
function math.sign(x)
  return x>0 and 1 or x<0 and -1 or 0
end

-- Function: Perform a signed clamp on a number, restricting it
--           to a specific maximum value while retaining its sign
--           (i.e. signedClamp(-45, 20) = -20, signedClamp(45, 20) = 20)
-- Arguments:
--  value (number): The number to clamp
--  max (number): The maximum value to clamp at
-- Returns:
--  1 (number): The clamped number
function math.clampSigned(value, max)
    local vs = math.sign(value)
    if math.abs(value) > max then
        return max * vs
    else
        return value
    end
end

-- Function: Decay a number towards 0 by a specific amount.
--           This will move its value towards 0 but will never flip
--           the sign. If the sign would change, the number becomes 0
-- Arguments:
--  value (number): The number to decay
--  max (number): The amount to decay by
-- Returns:
--  1 (number): The decayed number
function math.decay(value, amount)
    local originalSign = math.sign(value)
    if (originalSign == 0) then return 0 end
    local newValue = value - originalSign * amount
    local newSign = math.sign(value)
    if (originalSign ~= newSign) then
        return 0
    else
        return newValue
    end
end
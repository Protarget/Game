-- Type: rectangle
-- Type Definition: {x1, y1, x2, y2}
-- Type Description: An axis-aligned box defined by its top-left and bottom-right corners

local rectangle = {}

-- Function: Check if two rectangles overlap
-- Arguments:
--  a (rectangle): First rectangle
--  b (rectangle): Second rectangle
-- Returns:
--  1 (boolean): true if rectangles overlap, false otherwise
function rectangle.overlaps(a, b)
    return 
        a[1] < b[3] and a[3] > b[1] and
        a[2] < b[4] and a[4] > b[2]
end

-- Function: Offset a rectangle by a supplied vector
-- Arguments:
--  a (rectangle): Rectangle to offset
--  v (vector): Vector to offset by
-- Returns:
--  1 (rectangle): A new rectangle offset by the supplied vector
function rectangle.offset(a, v)
    return
        {a[1] + v[1], a[2] + v[2], a[3] + v[1], a[4] + v[2]}
end

-- Function: Get the width of a rectangle
-- Arguments:
--  r (rectangle): Rectangle to get the width of
-- Returns:
--  1 (number): The width of the rectangle
function rectangle.width(r)
    return math.abs(r[3] - r[1])
end

-- Function: Get the height of a rectangle
-- Arguments:
--  r (rectangle): Rectangle to get the height of
-- Returns:
--  1 (number): The height of the rectangle
function rectangle.height(r)
    return math.abs(r[4] - r[2])
end

-- Function: Calculate an expulsion vector for two rectangles
--           This is the shortest vector necessary to move the
--           second vector out of the first
-- Arguments:
--  a (rectangle): The rectangle that will remain static
--  b (rectangle): The rectangle that will be expelled
-- Returns:
--  1 (vector): The shortest vector necessary to remove b from a
function rectangle.expel(a, b)
    local outLeft = b[3] - a[1]
    local outRight = a[3] - b[1]
    local outTop = b[4] - a[2]
    local outBottom = a[4] - b[2]
    local shortestX = math.min(outLeft, outRight)
    local shortestY = math.min(outTop, outBottom)

    if (shortestX < shortestY) then
        if (shortestX == 0) then return {0, 0} end
        if (outLeft < outRight) then
            return {-outLeft, 0}
        else
            return {outRight, 0}
        end
    else
        if (shortestY == 0) then return {0, 0} end
        if (outTop < outBottom) then
            return {0, -outTop}
        else
            return {0, outBottom}
        end
    end
end

return rectangle
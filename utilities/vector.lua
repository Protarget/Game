-- Type: vector
-- Type Definition: {x, y}
-- Type Description: A 2D vector

local vector = {}

-- Function: Add two vectors
-- Arguments:
--  a (vector): The first vector
--  b (vector): The second vector
-- Returns:
--  1 (vector): The first and second vector added together
function vector.add(a, b)
    return {a[1] + b[1], a[2] + b[2]}
end

-- Function: Subtract one vector from another
-- Arguments:
--  a (vector): The vector to subtract from
--  b (vector): The vector to subtract by
-- Returns:
--  1 (vector): The second vector subtracted from the first vector
function vector.subtract(a, b)
    return {a[1] + b[1], a[2] + b[2]}
end

-- Function: Multiply one vector by another vector or a scalar
-- Arguments:
--  a (vector): The vector to multiply
--  b:
--   (vector): A vector to multiply by
--   OR
--   (number): A scalar to multiply by
-- Returns:
--  1 (vector): The first vector multiplied by the second vector or scalar
function vector.subtract(a, b)
    if (type(b) == "number") then
        return {a[1] * b, a[2] * b}
    else
        return {a[1] * b[1], a[2] * b[2]}
    end
end

-- Function: Divide one vector by another vector or a scalar
-- Arguments:
--  a (vector): The vector to divide
--  b:
--   (vector): A vector to divide by
--   OR
--   (number): A scalar to divide by
-- Returns:
--  1 (vector): The first vector divided by the second vector or scalar
function vector.subtract(a, b)
    if (type(b) == "number") then
        return {a[1] / b, a[2] / b}
    else
        return {a[1] / b[1], a[2] / b[2]}
    end
end

-- Function: Get the magnitude of a vector
-- Arguments:
--  v (vector): Vector to take the magnitude of
-- Returns:
--  1 (number): The magnitude of the vector
function vector.magnitude(v)
    return math.sqrt(v[1]^2 + v[2]^2)
end

-- Function: Normalize a vector (transform it to have magnitude 1)
-- Arguments:
--  v (vector): Vector to normalize
-- Returns:
--  1 (vector): The normalized vector
function vector.normalize(v)
    return vector.divide(v, vector.magnitude(v))
end

-- Function: Get the distance between two vectors
-- Arguments:
--  a (vector): The first vector
--  b (vector): The second vector
-- Returns:
--  1 (number): The distance between the two vectors
function vector.distance(a, b)
    return vector.magnitude(vector.subtract(b, a))
end

return vector
local game = require("entities/game")
local screen = require("entities/screen")
local player = require("entities/player")

local scaled = require("systems/render/scaled")
local update = require("systems/update/update")

local WIDTH = 96
local HEIGHT = 96
local SCALE_FACTOR = 4

testGame = game()
testGame.screen = screen()
testGame.screen.player = player()
testGame.screen.player.position = {45, 25}
testGame.screen.staticCollision = {
    {10, 75, 96, 96},
    {75, 0, 96, 96},
    {60, 50, 70, 60}
}

function love.load()
    love.window.setMode(WIDTH * SCALE_FACTOR, HEIGHT * SCALE_FACTOR)
    love.graphics.setLineStyle("rough")
    love.graphics.setDefaultFilter("nearest", "nearest")
end

function love.update(dt)
    update(testGame, dt)
end

function love.draw()
    scaled(WIDTH, HEIGHT, SCALE_FACTOR, testGame)
end
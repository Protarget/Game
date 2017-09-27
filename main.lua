local game = require("entities/game")
local screen = require("entities/screen")
local player = require("entities/player")

local scaled = require("systems/render/scaled")
local update = require("systems/update/update")

local WIDTH = 96
local HEIGHT = 96
local SCALE_FACTOR = 4

testGame = game()

local testPlayer = player()
testPlayer.position = {45, 25}

local testScreen = screen()
testScreen.staticCollision = {
    {0, 75, 96, 96},
    {75, 0, 96, 96},
    {60, 50, 70, 60},
    {60, 67, 70, 75}
}
testScreen.ladders = {
    {30, -5, 40, 75}
}

local testScreenLeft = screen()
testScreenLeft.staticCollision = {
    {0, 75, 96, 96},
    {40, 30, 60, 40}
}
testScreenLeft.ladders = {
    {45, 40, 55, 75},
    {55, 40, 70, 50},
    {60, 20, 70, 40},
}

local testScreenUp = screen()
testScreenUp.staticCollision = {
    {50, 50, 96, 60}
}
testScreenUp.ladders = {
    {30, 10, 40, 100}
}


testGame.screens = {
    ["0,0"] = testScreen,
    ["-1,0"] = testScreenLeft,
    ["0,-1"] = testScreenUp
}


testGame.screen = testGame.screens["0,0"]
testGame.screen.player = testPlayer

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
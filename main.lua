love.graphics.setDefaultFilter("nearest", "nearest")

local Map = require("src/map")
local Player = require("src/player")
local Camera = require("src/camera")
local Background = require("src/background")

function love.load()
    Map:load()

    Player:load()

    Background:load()
end

function love.update(dt)
    Map:update(dt)

    Player:update(dt)

    Camera:setPosition(Player.x, 0)
end

function love.keypressed(key)
    Player:keypressed(key)
    
    Map:keypressed(key)

    if key == "escape" then
        love.event.quit()
    end
end

function love.mousemoved(x,y, dx,dy)
    
end

function love.draw()
    Background:draw()

    Camera:attach()

    Player:draw()

    Camera:detach()

    Map:draw()
end

function beginContact(a, b, collision)
    --Player:beginContact(a, b, collision)
end

function endContact(a, b, collision)
    --Player:endContact(a, b, collision)
end
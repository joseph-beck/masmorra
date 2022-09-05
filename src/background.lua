local Background = {}

function Background:load()
    -- Placeholder background
    self.layerOne = love.graphics.newImage("assets/dungeon/dungeon-background-2.png")
end

function Background:update(dt)

end

function Background:draw()
    love.graphics.draw(self.layerOne, 0, 0, 0, 0.6, 0.6)
end

return Background
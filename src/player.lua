local Player = {}

function Player:load()
    self.x = 100
    self.y = 100
    self.startX = 100
    self.startY = 100
    self.width = 20
    self.height = 60
    
    self.xVel = 0
    self.yVel = 0
    self.maxSpeed = 175
    self.acceleration = 5000
    self.friction = 3750

    self.attackTime = 0.2
    self.animationTime = 0.2
    self.dashTime = 0.2
    self.dashCooldown = 5
    self.dashCooldownRemaining = 0
    
    self.physics = {}
    self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
    self.physics.body:setFixedRotation(true)
    self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
    self.physics.body:setGravityScale(0)
end

function Player:update(dt)
    self:move(dt)
    self:syncPhysics()
end

function Player:keypressed(key)
    self:dash(key)
end

function Player:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Player:move(dt)
    if love.keyboard.isDown("w", "up") then
        self.yVel = math.max(self.yVel - self.acceleration * dt, -self.maxSpeed)
    else
        self:applyFrictionY(dt)
    end

    if love.keyboard.isDown("a", "left") then
        self.xVel = math.max(self.xVel - self.acceleration * dt, -self.maxSpeed)
    else
        self:applyFrictionX(dt)
    end

    if love.keyboard.isDown("s", "down") then
        self.yVel = math.max(self.yVel + self.acceleration * dt, self.maxSpeed)
    else
        self:applyFrictionY(dt)
    end

    if love.keyboard.isDown("d", "right") then
        self.xVel = math.min(self.xVel + self.acceleration * dt, self.maxSpeed)
    else
        self:applyFrictionX(dt)
    end
end

function Player:applyFrictionX(dt)
    if self.xVel > 0 then
        self.xVel = math.max(self.xVel - self.friction * dt, 0)
    elseif self.xVel < 0 then
        self.xVel = math.min(self.xVel + self.friction * dt, 0)
    end
end

function Player:applyFrictionY(dt)
    if self.yVel > 0 then
        self.yVel = math.max(self.yVel - self.friction * dt, 0)
    elseif self.yVel < 0 then
        self.yVel = math.min(self.yVel + self.friction * dt, 0)
    end
end

function Player:syncPhysics()
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xVel, self.yVel)
end

function Player:resetPosition()
    self.physics.body:setPosition(self.startX, self.startY)
end

function Player:dash(key)
    if key == "f" then
        --dash
    end
end

return Player
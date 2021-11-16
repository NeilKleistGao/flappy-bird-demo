Pipe = class("Pipe")

function Pipe:ctor()
  self.speed = -150.0
  self.pos = 0.0
  self.passed = false
end

function Pipe:enter()
  self.pos = self.game_object:getPositionX()
  self.move("Move")
end

function Pipe:updateMove(delta)
  local dx = delta * self.speed
  self.pos = self.pos + dx
  self.game_object:setPositionX(self.pos)

  if self.pos <= 100.0 then
    self.notifyAll("Pass", nil)
    self.move("Rest")
  end
end

function Pipe:updateRest(delta)
  local dx = delta * self.speed
  self.pos = self.pos + dx
  self.game_object:setPositionX(self.pos)

  if self.pos <= -30.0 then
    self.passed = true
    self.halt()
  end
end

function Pipe:exit()
  if self.passed then
    local gp = self.game_object:getParent()
    gp:removeChild(self.game_object)
  end
end

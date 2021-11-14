Scroller = class("Scroller")

function Scroller:ctor()
  self.end_pos = -152.0
  self.start_pos = 460.0
  self.speed = -150.0
  self.pos = 0.0
end

function Scroller:enter()
  self.pos = self.game_object:getPositionX()
  self.move("Roll")
end

function Scroller:updateRoll(delta)
  local dx = delta * self.speed
  self.pos = self.pos + dx

  if self.pos <= self.end_pos then
    self.pos = self.start_pos
  end

  self.game_object:setPositionX(self.pos)
end

function Scroller:exit()
end

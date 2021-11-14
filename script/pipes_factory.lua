PipesFactory = class("PipesFactory")

function PipesFactory:ctor()
  self.random = engine.Random()
  self.timer = 0.0
  self.list = {}
  self.head = 0
  self.tail = 0
end

function PipesFactory:enter()
  self.move("Idle")
end

function PipesFactory:updateIdle(delta)
  self.timer = self.timer - delta
  if self.timer <= 0.0 then
    self.move("Generate")
  end
end

function PipesFactory:updateGenerate()
  self.timer = self.timer + 1.2

  local pipe = PrefabFactory:loadPrefab("pipe")
  pipe:setPosition(engine.vec2(360, self.random:getRangeRandomNumber(-75, 50)))
  self.game_object:addChild("pipe", pipe)
  self.list[self.tail] = pipe
  self.tail = self.tail + 1

  self.move("Idle")
end

function PipesFactory:getNextPipePosition()
  if self == nil or self.tail - self.head == 0 then
    return engine.vec2(360, 0)
  end

  return self.list[self.head]:getPosition()
end

function PipesFactory:onPass(sender, data)
  self.list[self.head] = nil
  self.head = self.head + 1
end

function PipesFactory:exit()
end

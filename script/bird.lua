Bird = class("Bird")

function Bird:ctor()
  self.rigid = nil
  self.anim = nil
  self.gg = false
end

function Bird:enter()
  self.rigid = engine.RigidBody.getComponent(self.game_object)
  self.anim = engine.AsepriteAnimation.getComponent(self.game_object)
  self.move("Play")
end

function Bird:updatePlay()
  if Input:getKeyReleased(KEY_CODE.SPACE) then
    self:fly()
  end
end

function Bird:fly()
  self.rigid:setVelocity(engine.vec2(0, 20))
  self.anim:play("fly")
end

function Bird:wait()
end

function Bird:getPosition()
  return self.game_object:getPosition()
end

function Bird:onBeginContact(sender, data)
  self.gg = true
  self.notifyAll("GameOver", nil)
end

function Bird:isGG()
  return self.gg
end

function Bird:exit()
end

ScoreGetter = class("ScoreGetter")

function ScoreGetter:ctor()
end

function ScoreGetter:enter()
  local label = engine.Label.getComponent(self.game_object)
  local score = Archive:getInteger("score", 0)
  label:setText("Your Score: "..tostring(score))
  self.halt()
end

function ScoreGetter:exit()
end

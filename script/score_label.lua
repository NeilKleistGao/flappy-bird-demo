ScoreLabel = class("ScoreLabel")

function ScoreLabel:ctor()
  self.score = 0
  self.label = nil
end

function ScoreLabel:enter()
  self.label = engine.Label.getComponent(self.game_object)
  self.move("Idle")
end

function ScoreLabel:updateIdle()
end

function ScoreLabel:onPass()
  self.score = self.score + 1
  local text = "Score: "..tostring(self.score)
  self.label:setText(text)
end

function ScoreLabel:onGameOver()
  print("score: "..tostring(self.score))
  Archive:setInteger("score", self.score)
  Archive:flush()
  if not Archive:getBoolean("training") then
    Game:destroyAndLoadWorld("score")
  end
end

function ScoreLabel:exit()
end

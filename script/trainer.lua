Trainer = class("Trainer")

function Trainer:ctor()
    self.bird = nil
    self.env = nil
    self.timer = 0.0
end

function Trainer:enter()
    local training = Archive:getBoolean("training")
    if not training then
        self.halt()
        return
    end

    if _G["env"] ~= nil then
        self.env = _G["env"]
    else
        local alg = engine.QLearning.create(2, 0.6, 0.8, 0.01)
        self.env = engine.Environment.create(nil, nil, alg, "q_learning.lua", "QLearningHelper")
        _G["env"] = self.env
    end

    self.bird = engine.StateMachine.getComponent(self.game_object, "Bird").this

    local agent = engine.Agent.create(self.game_object)
    agent:addAction("Bird", "wait")
    agent:addAction("Bird", "fly")
    self.env:setAgent(agent)

    local ob = engine.Observations.create(engine.Game.getInstance():getCurrentWorld())
    ob:addObservation("pos", "", "PipesFactory", "getNextPipePosition")
    ob:addObservation("bird", "bird", "Bird", "getPosition")
    ob:addObservation("gg", "bird", "Bird", "isGG")
    self.env:setObservations(ob)
    self.move("Training")
end

function Trainer:updateTraining(delta)
    self.env:update()
end

function Trainer:onGameOver()
    self.env:update()
end

function Trainer:exit()
    if self.env ~= nil then
        self.env:reset()
    end
end
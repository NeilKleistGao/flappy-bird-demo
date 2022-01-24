QLearningHelper = class("QLearningHelper")

function QLearningHelper:ctor()
end

function QLearningHelper:reset()
    engine.Game.getInstance():destroyAndLoadWorld("score")
end

function QLearningHelper:update(agent, ob)
    local pos = ob["pos"]
    local bird = ob["bird"]
    local sub_x = (pos.x - bird.x) / 10.0
    local sub_y = (pos.y - bird.y) / 10.0
    return tostring(math.floor(sub_x) )..","..tostring(math.floor(sub_y))
end

function QLearningHelper:getReward(agent, ob)
    if ob["gg"] then
        return -100
    else
        return 1
    end
end

function QLearningHelper:isEnd(agent, ob)
    return ob["gg"]
end
QLearningHelper = class("QLearningHelper")

function QLearningHelper:ctor()
end

function QLearningHelper:reset()
    Game:destroyAndLoadWorld("game")
end

function QLearningHelper:update(agent, ob)
    local pos = ob["pos"]
    local bird = ob["bird"]
    local sub_x = (pos.x - bird.x) / 15.0
    local sub_y = (pos.y - bird.y) / 15.0
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
    return Game:getCurrentWorldName() ~= "game"
end
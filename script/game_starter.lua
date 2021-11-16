GameStarter = class("GameStarter")

function GameStarter:ctor()
    self.auto = false
end

function GameStarter:enter()
    self.move("Idle")
end

function GameStarter:updateIdle(delta)
    if Input:getKeyReleased(KEY_CODE.SPACE) then
        Archive:setBoolean("training", false)
        Game:destroyAndLoadWorld("game")
    elseif self.auto and Archive:getBoolean("training") then
        Game:destroyAndLoadWorld("game")
    end
end

function GameStarter:onGameStart(sender, data)
    if data then
        print("training mode")
    else
        print("entertaining mode")
    end
    Archive:setBoolean("training", data)
    Game:destroyAndLoadWorld("game")
end

function GameStarter:exit()
end
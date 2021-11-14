WelcomeButton = class("WelcomeButton")

function WelcomeButton:ctor()
    self.training_mode = false
end

function WelcomeButton:enter()
    self.move("Idle")
end

function WelcomeButton:updateIdle()
end

function WelcomeButton:onClick()
    self.notify("GameStart", self.training_mode)
end

function WelcomeButton:exit()
end
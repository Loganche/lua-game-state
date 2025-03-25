local StateMachine = {
    currentState = nil,
    previousState = nil,
    confState = nil
}

local function assertState(state)
    assert(state == nil or type(state) == "table", "State must be a table or nil")
end

local function assertFunction(state, funcName)
    if state and state[funcName] then
        assert(type(state[funcName]) == "function", funcName .. " must be a function")
    end
end

function StateMachine:getPreviousState()
    return self.previousState
end

function StateMachine:getState()
    return self.currentState
end

function StateMachine:setState(newState)
    assertState(newState)

    if self.currentState == newState then return end

    self.previousState = self.currentState
    self.currentState = newState

    if self.currentState then
        assertFunction(self.currentState, "enter")
        if self.currentState.enter then
            self.currentState:enter()
        end
    end
end

function StateMachine:reloadState()
    if self.currentState then
        assertFunction(self.currentState, "enter")
        if self.currentState.enter then
            self.currentState:enter()
        end
    end
end

function StateMachine:revertState()
    if self.previousState then
        self:setState(self.previousState)
    end
end

function StateMachine:nextState()
    if self.confState then
        local state, pos = self.currentState.__tostring()
        local nextState = self.confState[state][pos]

        if nextState == "dummy" then
                StateMachine:reloadState()
        -- elseif nextState == "revert" then
        --     GameStateManager:setState(mainMenu)
        else
            self:setState(nextState)
        end
    end
end

function StateMachine:mousemoved(x, y, ...)
    assert(type(x) == "number", "x must be a number")
    assert(type(y) == "number", "y must be a number")
    if self.currentState then
        assertFunction(self.currentState, "mousemoved")
        if self.currentState.mousemoved then
            self.currentState:mousemoved(x, y, ...)
        end
    end
end

function StateMachine:wheelmoved(x, y)
    assert(type(x) == "number", "x must be a number")
    assert(type(y) == "number", "y must be a number")
    if self.currentState then
        assertFunction(self.currentState, "wheelmoved")
        if self.currentState.wheelmoved then
            self.currentState:wheelmoved(x, y)
        end
    end
end

function StateMachine:mousepressed(x, y, button)
    assert(type(x) == "number", "x must be a number")
    assert(type(y) == "number", "y must be a number")
    assert(type(button) == "number", "button must be a number")
    if self.currentState then
        assertFunction(self.currentState, "mousepressed")
        if self.currentState.mousepressed then
            self.currentState:mousepressed(x, y, button)
        end
    end
end

function StateMachine:mousereleased(x, y, button)
    assert(type(x) == "number", "x must be a number")
    assert(type(y) == "number", "y must be a number")
    assert(type(button) == "number", "button must be a number")
    if self.currentState then
        assertFunction(self.currentState, "mousereleased")
        if self.currentState.mousereleased then
            self.currentState:mousereleased(x, y, button)
        end
    end
end

function StateMachine:keypressed(key, scancode, isrepeat)
    assert(type(key) == "string", "key must be a string")
    assert(type(scancode) == "string", "scancode must be a string")
    assert(type(isrepeat) == "boolean", "isrepeat must be a boolean")
    if self.currentState then
        assertFunction(self.currentState, "keypressed")
        if self.currentState.keypressed then
            self.currentState:keypressed(key, scancode, isrepeat)
        end
    end
end

function StateMachine:keyreleased(key, scancode)
    assert(type(key) == "string", "key must be a string")
    assert(type(scancode) == "string", "scancode must be a string")
    if self.currentState then
        assertFunction(self.currentState, "keyreleased")
        if self.currentState.keyreleased then
            self.currentState:keyreleased(key, scancode)
        end
    end
end

function StateMachine:textinput(text)
    assert(type(text) == "string", "text must be a string")
    if self.currentState then
        assertFunction(self.currentState, "textinput")
        if self.currentState.textinput then
            self.currentState:textinput(text)
        end
    end
end

function StateMachine:update(dt)
    assert(type(dt) == "number", "dt must be a number")
    if self.currentState then
        assertFunction(self.currentState, "update")
        if self.currentState.update then
            self.currentState:update(dt)
        end
    end
end

function StateMachine:quit()
    if self.currentState then
        assertFunction(self.currentState, "quit")
        if self.currentState.quit then
            self.currentState:quit()
        end
    end
end

function StateMachine:draw()
    if self.currentState then
        assertFunction(self.currentState, "draw")
        if self.currentState.draw then
            self.currentState:draw()
        end
    end
end

function StateMachine:resize(w, h)
    assert(type(w) == "number", "w must be a number")
    assert(type(h) == "number", "h must be a number")
    if self.currentState then
        assertFunction(self.currentState, "resize")
        if self.currentState.resize then
            self.currentState:resize(w, h)
        end
    end
end

return StateMachine


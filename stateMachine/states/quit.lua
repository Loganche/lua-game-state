local Quit = {}


function Quit:enter()
    print("Entered Quit")
    love.event.push("quit")
end

function Quit:update(dt)

end

function Quit:draw()
end

function Quit:keypressed(key, scancode, isrepeat)
end

function Quit:quit()
    print("Exited Quit")
end

function Quit:__tostring()
    return 'Quit', nil
end

return Quit

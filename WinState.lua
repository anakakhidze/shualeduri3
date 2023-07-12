WinState = Class{__includes = BaseState}


function WinState:render()
	love.graphics.printf('Won!', 0, 80, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('press enter to play again', 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Score: 20', 0, 100, VIRTUAL_WIDTH, 'center')

end

	
function WinState:update(dt)
    if love.keyboard.isDown('return') then
         stateMachine:change('start')
    end
end
        
      

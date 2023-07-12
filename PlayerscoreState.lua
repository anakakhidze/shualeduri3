PlayerscoreState = Class{__includes = BaseState}

function PlayerscoreState:enter(params)
	self.playerscore = params.playerscore
end

function PlayerscoreState:update(dt)
	if love.keyboard.isDown('return') then
		stateMachine:change('start')
                self.playerscore = 0
	end
end

function PlayerscoreState:render()
	
	love.graphics.printf('Game over!', 0, 80, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('press enter to play again', 0, 120, VIRTUAL_WIDTH, 'center')

	love.graphics.printf('Score: '.. tostring(self.playerscore), 0, 100, VIRTUAL_WIDTH, 'center')
end
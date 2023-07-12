StartState = Class{__includes = BaseState}

function StartState:update(dt)
	if love.keyboard.isDown('return') then
		stateMachine:change('play')
	end
end


function StartState:render()
love.graphics.newFont('font.ttf', 10)
	love.graphics.printf(
		'Welcome to the Game!',
		0,
		10,
		VIRTUAL_WIDTH,
		'center')

	love.graphics.printf(
		'Press Enter to Play!',
		0,
		100,
		VIRTUAL_WIDTH,
		'center')

	
end


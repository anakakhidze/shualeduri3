push = require 'push'
Class = require 'class'

require 'Player'
require 'Ball'

require 'StateMachine'

require 'BaseState'
require 'StartState'
require 'PlayState'
require 'PlayerscoreState'
require 'WinState'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


PLAYER_SPEED = 8

function love.load()
        background = love.graphics.newImage('background.png')
	io.stdout:setvbuf("no")
	
        love.graphics.setDefaultFilter('nearest', 'nearest')
       
        love.window.setTitle('catch the ball')
        
        math.randomseed(os.time())

        font = love.graphics.newFont('font.ttf', 16)
        

	love.graphics.setFont(font)	

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})
	

	stateMachine =  StateMachine {
		['start'] = function() return StartState() end,
                ['play'] = function() return PlayState() end,
                ['playerscore'] = function() return PlayerscoreState() end,     
                ['win'] = function() return WinState() end     
	}
	
	stateMachine:change('start')
     
        sounds = {
		['catch'] = love.audio.newSource('catch.wav', 'static'),
		['win'] = love.audio.newSource('win.wav', 'static'),	
		['fail'] = love.audio.newSource('fail.wav', 'static')
	}
	

end


function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
	
end	

function love.update(dt)
       stateMachine:update(dt)
       
     
end

function love.draw()
	push:start()
	
        love.graphics.draw(background,0,0)	
	 
       
        stateMachine:render()
            
	
	push:finish()
end

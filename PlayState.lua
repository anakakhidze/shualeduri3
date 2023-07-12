PlayState = Class{__includes = BaseState}

function PlayState:init()
	self.ball = Ball()
        self.player = Player()
	self.playerscore = 0
end


function PlayState:update(dt)
     
                   self.ball:update(dt)

                   if self.player:collides(self.ball) then 
                        sounds['catch']:play()
                        self.playerscore = self.playerscore + 1    
                        if (self.playerscore == 20)then                   
                           stateMachine:change('win')
                           sounds['win']:play()
                        end
                        self.ball:reset()
                       
                   
                   elseif self.ball.y > VIRTUAL_HEIGHT  then
                         stateMachine:change('playerscore',{
					playerscore = self.playerscore
				})
                        sounds['fail']:play()
                        self.ball:reset()
                                           
                   end                                        
        
 
                   if love.keyboard.isDown('right') then
	               self.player.x = math.min(self.player.x + PLAYER_SPEED, VIRTUAL_WIDTH - self.player.width)
                   elseif  love.keyboard.isDown('left') then
	               self.player.x = math.max(self.player.x - PLAYER_SPEED, 0)
                   end

          
end 


function PlayState:render()
	
	self.player:render()
	self.ball:render()
	
	
	love.graphics.printf(tostring(self.playerscore), 0, 10, VIRTUAL_WIDTH,'center')
end





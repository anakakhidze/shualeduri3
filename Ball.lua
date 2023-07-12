Ball=Class{}

function Ball:init()
         self.image = love.graphics.newImage('ball.png')
         self.width=10
         self.height=10
        
         self.x = math.random(0, VIRTUAL_WIDTH - self.width)
         self.y = 0 - self.height


         self.dy = 250

         
end

function Ball:reset()
	self.x = math.random(0, VIRTUAL_WIDTH - self.width)
	self.y = 0 - self.height
	
	self.dy = 200
end

function Ball:update(dt)
          self.y = self.y + self.dy* dt --ball.y
end

function Ball:render()
          love.graphics.draw(self.image, self.x, self.y)
end


game = require "game"
view = require "view"
constants = require "constants"

local direction = constants.direction
local speedCheck = 0
local id = constants.id

function love.load()
	game.reset()
end

function love.update(dt)
	speedCheck = speedCheck + dt
	if speedCheck > 10/game.world.speed then
		tailPosition = game.world.snake.tail.getEndPosition()
		game.world.snake.walk()
		game.world.checkSnakeSize(tailPosition)
		game.world.snake.setTurnLock(false)
		speedCheck = 0
		local collision = game.world.checkCollision()
		if collision == id.fruit then
			game.world.generateRandomFruit()
			game.score = game.score + game.world.fruits.consume()
		elseif collision == id.wall or collision == id.snake then
			game.reset()
		end
	end
end

function love.keypressed(key)
	if key == "up" then
		game.world.snake.turn(direction.north)
	elseif key == "down" then
		game.world.snake.turn(direction.south)
	elseif key == "left" then
		game.world.snake.turn(direction.west)
	elseif key == "right" then
		game.world.snake.turn(direction.east)
	elseif key == 'r' then
		game.reset()
	elseif key == 'q' then
		game.world.speed = 5 * game.world.speed;
	elseif key == 'w' then
		game.world.speed = game.world.speed/5;
	elseif key == 't' then
		game.world.fruits.pop()
	end
end

function love.draw()
	--view.drawMap(world)
	view.drawSnake(game.world)
	view.drawFruits(game.world)
	view.drawBorder()
end
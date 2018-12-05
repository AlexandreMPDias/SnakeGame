game = require "game"
view = require "view"
constants = require "constants"
config = require "config"

local direction = constants.direction
local speedCheck = 0
local id = constants.id

function love.load()
	game.reset()
end

function love.update(dt)
	if game.state == constants.gameState.running then
		speedCheck = speedCheck + dt
		if speedCheck > 10/game.world.speed then
			tailPosition = game.world.snake.tail.getEndPosition()
			if game.nextTurn then
				game.world.snake.setTurnLock(false)
				game.world.snake.turn(game.nextTurn)
				game.nextTurn = nil
			end
			game.world.snake.walk()
			game.world.checkSnakeSize(tailPosition)
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
end

function love.keypressed(key)
	game.keyMapping(key)
end

function love.draw()
	if constants.game.grid then
		view.drawMap(world)
	end
	view.drawSnake(game.world)
	view.drawFruits(game.world)
	view.drawBorder()
	view.drawScore(game)
end
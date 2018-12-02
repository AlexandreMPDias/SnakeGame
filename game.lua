game = {}

local constants = require "constants"
game.world = require "world"

game.score = 0

game.nextTurn = nil

function loadHighScore()

end

function updateHighscore(highscore)

end

game.reset = function()
	game.score = 0
	game.world.speed = constants.game.speed
	world.snake.clear()
	world.fruits.clear()
	world.generateRandomFruit()
end

function game.keyMapping(key)
	if key == "up" then
		game.nextTurn = direction.north
	elseif key == "down" then
		game.nextTurn = direction.south
	elseif key == "left" then
		game.nextTurn = direction.west
	elseif key == "right" then
		game.nextTurn = direction.east
	elseif key == "up" then
			game.world.snake.turn(direction.north)
	-- elseif key == "down" then
	-- 	game.world.snake.turn(direction.south)
	-- elseif key == "left" then
	-- 	game.world.snake.turn(direction.west)
	-- elseif key == "right" then
	-- 	game.world.snake.turn(direction.east)
	elseif key == 'r' then
		game.reset()
	elseif key == 'q' then
		game.world.speed = 5 * game.world.speed;
	elseif key == 'w' then
		game.world.speed = game.world.speed/5;
	end
end

return (game)
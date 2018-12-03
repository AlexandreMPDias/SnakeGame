game = {}

local utils = require "utils"
local constants = require "constants"
game.world = require "world"
game.state = constants.gameState.running

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

function toggleDebugMode()
	if constants.game.debugMode == false then
		constants.game.debugMode = true
	else
		constants.game.debugMode = false
	-- constants.debugMode = ~constants.debugMode
	end
end

function toggleGrid()
	if constants.game.grid == false then
		constants.game.grid = true
	else
		constants.game.grid = false
	-- constants.debugMode = ~constants.debugMode
	end
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
	elseif key == 'r' then
		game.reset()
	elseif key == 'q' then
		game.world.speed = 5 * game.world.speed;
	elseif key == 'w' then
		game.world.speed = game.world.speed/5;
	elseif key == 'z' then
		constants.view.scale = constants.view.scale - 1
		utils.resize()
	elseif key == 'x' then
		constants.view.scale = constants.view.scale + 1
		utils.resize()
	elseif key == 'd' then
		toggleDebugMode()
	elseif key == 'g' then
		toggleGrid()
	elseif key == "space" then
		if game.state == constants.gameState.running then
			game.state = constants.gameState.paused
		elseif game.state == constants.gameState.paused then
			game.state = constants.gameState.running
		end
	end
end

return (game)
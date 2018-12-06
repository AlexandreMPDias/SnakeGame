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
	world.snake.clear()
	world.fruits.clear()
	world.generateRandomFruit()
end

function toggleDebugMode()
	if constants.game.debugMode == false then
		constants.game.debugMode = true
	else
		constants.game.debugMode = false
	end
end

function toggleGrid()
	if constants.game.grid == false then
		constants.game.grid = true
	else
		constants.game.grid = false
	end
end


function game.keyMapping(key)
	if constants.controller.active == constants.controller.options.keyboard then
		if key == "up" then
			game.nextTurn = direction.north
		elseif key == "down" then
			game.nextTurn = direction.south
		elseif key == "left" then
			game.nextTurn = direction.west
		elseif key == "right" then
			game.nextTurn = direction.east
		end
	elseif constants.controller.active == constants.controller.options.nodeMCU then
		local nextDirection = game.world.snake.avaiableDirections()
		local CC = nextDirection[0]
		local CW = nextDirection[1]
		local botao_esquerdo_foi_clicado = ( key == "left" )
		local botao_direito_foi_clicado = ( key == "right" )

		if botao_esquerdo_foi_clicado then
			game.nextTurn = CC
		elseif botao_direito_foi_clicado then
			game.nextTurn = CW
		end
	end
	if key == 'r' then
		game.reset()
		game.world.speed = constants.game.speed
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
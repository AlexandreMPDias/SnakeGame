snake = require "snake"
fruits = require "fruits"
constants = require "constants"
utils = require "utils"

world = {}
world.snake = snake
world.fruits = fruits
world.locked = false

world.boundries = constants.map.size
world.speed = constants.game.speed
map = {}
for i = 1,world.boundries do
	map[i] = {}
	for j = 1,world.boundries do
		map[i][j] = 1
	end
end

function isSnakeOutOfBounds()
	if snake.head.x > world.boundries or snake.head.x < 1 then
		return true
	elseif snake.head.y > world.boundries or snake.head.y < 1 then
		return true
	end
	return false
end

world.checkCollision = function()
	if world.fruits.isEmpty() == true then
		world.generateRandomFruit()
	end
	--print(utils.exibeCoords(world.fruits.getNewest())..utils.exibeCoords(world.snake.head))
	if isSnakeOutOfBounds() then 
		--checks collision with outter wall
		return constants.id.wall
	elseif world.snake.isTail(world.snake.head.x, world.snake.head.y) then 
		--checks collision with own tail
		return constants.id.snake
	elseif utils.compareCoords(world.fruits.getNewest() , world.snake.head) then
		--checks collision with fruit and head
		return constants.id.fruit
	else
		return constants.id.nothing
	end
end

world.checkSnakeSize = function(tailPosition)
	local oldestFruit = world.fruits.getOldest()
	if utils.compareCoords(oldestFruit , tailPosition) then
		world.fruits.pop()
		world.snake.tail.increaseTail(oldestFruit.x, oldestFruit.y)
	end
end

world.generateRandomFruit = function()
	--Generates a random position for a fruit.
	local avaiableSquares = {}
	for i=1,#map do
		for j = 1, #map[i] do
			if(snake.isHere(i,j) == false) then
				position = {}
				position.x = i
				position.y = j
				table.insert(avaiableSquares, position)
			end
		end
	end
	math.randomseed(os.time())
	math.random(); math.random(); math.random();
	--To get better pseudo-random number just pop some random number before using them for real:

	local index = math.random(1, #avaiableSquares)
	world.fruits.add(avaiableSquares[index].x, avaiableSquares[index].y)
end

return (world)
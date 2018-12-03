constants = require "constants"
utils = require "utils"

view = {}
color = {}
color.snake = utils.makeColor('#49AB81', 73,171,129)
color.terrain = utils.makeColor('#A7784E', 167, 120, 78)
color.fruit = utils.makeColor('#DF4815', 223, 72, 21)
view.color = color

love.window.setTitle("Snake Game")

function drawMap(world)
	if constants.game.debugMode == true then
		fillMap = 'line'
		love.graphics.setColor(250,10,150,0.5)--(view.color.terrain.rgb)
		space = 0
		for i = 1,world.boundries do
			for j = 1,world.boundries do
				--love.graphics.setColor(150,150,150,0.5)--(view.color.terrain.rgb)
				utils.drawRectangle(i,j,fillMap)
			end
		end
	end
end

function drawSnake(world)
	love.graphics.setColor(view.color.snake.rgb)
	utils.drawRectangle(world.snake.head.x , world.snake.head.y)
	tail = world.snake.tail
--	print("Snake")
	for i=1,#tail.segment do
		--io.write("\t[".. i .."]: ")
		--utils.drawRectangle(tail.segment[i].x , tail.segment[i].y)
		utils.drawSnake(tail.segment[i].x , tail.segment[i].y, i)
		if constants.game.debugMode == true then
			utils.printUnderSnake(tail.segment[i])
		end

	end
end

function drawFruits(world)
	love.graphics.setColor(view.color.fruit.rgb)
	if constants.game.debugMode == true then
		for i=1,#world.fruits do
			utils.drawFruits(world.fruits[i].x, world.fruits[i].y, 1.5)
		end
	else
		local newest = world.fruits.getNewest()
		utils.drawFruits(newest.x, newest.y, 0.8)
	end
end

function drawBorder()
	love.graphics.setColor(255,255,255)
	utils.border()
end

function resize(width, height)
	love.window.setMode(width, height)
end

view.setColor = setColor
view.drawMap = drawMap
view.drawSnake = drawSnake
view.drawFruits = drawFruits
view.drawBorder = drawBorder
view.resize = resize
return (view)
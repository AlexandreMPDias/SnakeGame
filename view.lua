constants = require "constants"
utils = require "utils"

view = {}
color = {}
color.snake = utils.makeColor('#49AB81', 73,171,129)
color.terrain = utils.makeColor('#A7784E', 167, 120, 78)
color.fruit = utils.makeColor('#DF4815', 223, 72, 21)
view.color = color

function drawMap(world)
	love.graphics.setColor(150,150,150)--(view.color.terrain.rgb)
	space = 0
	for i = 1,world.boundries do
		for j = 1,world.boundries do
			love.graphics.setColor(150,150,150)--(view.color.terrain.rgb)
			utils.drawRectangle(i,j)
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
	end
end

function drawFruits(world)
	local newest = world.fruits.getNewest()
	--print(newest)
	--print(utils.exibeCoords(newest))
	love.graphics.setColor(view.color.fruit.rgb)
	--utils.drawRectangle(newest.x, newest.y)
	for i=1,#world.fruits do
		utils.drawFruits(world.fruits[i].x, world.fruits[i].y)
	end
end

function drawBorder()
	love.graphics.setColor(255,255,255)
	utils.border()
end


view.setColor = setColor
view.drawMap = drawMap
view.drawSnake = drawSnake
view.drawFruits = drawFruits
view.drawBorder = drawBorder
return (view)
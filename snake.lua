constants = require "constants"

direction = constants.direction

tail = {}
snake = {}

function createTailSegment(x,y)
	-- Creates another Tail Segment
	a = {}
	a.x = x
	a.y = y
	a.dir =  dir
	table.insert(tail.segment, a)
end

function getEndPosition()
	a = {}
	a.x = tail.segment[#tail.segment].x
	a.y = tail.segment[#tail.segment].y
	return a
end

tail.length = 0
tail.segment = {}
tail.increaseTail = createTailSegment
tail.getEndPosition = getEndPosition

function getNextPosition()
	-- Calculates based on the current Head direction, the next position of the Head
	x,y = snake.head.x, snake.head.y 
	if snake.direction == constants.direction.north then
		return x, y + 1
	elseif snake.direction == constants.direction.south then
		return x, y - 1
	elseif snake.direction == constants.direction.east then
		return x + 1, y
	elseif snake.direction == constants.direction.west then
		return x - 1, y
	else 
		print("[Error] head.direction must be set. Head value = " .. head.direction)
	end
end

function isValidTurn(direc)
	-- Checks if the receiving new direction is a valid direction.
	-- When walking vertically, the snake may only turn to a horizontal direction
	-- When walking horizontally, the snake may only turn to a vertical direction
	if (snake.direction == direction.north or snake.direction == direction.south) then
		return direc == direction.west or direc == direction.east
	else
		return direc == direction.north or direc == direction.south
	end
end

snake.direction = constants.start.direction;
snake.tail = tail
snake.head = {}
snake.head.x = constants.start.x
snake.head.y = constants.start.y
snake.turnLocked = false
snake.setTurnLock = function(lock)
	snake.turnLocked = lock
end
snake.walk = function()
	x,y = getNextPosition()
	local last = {}
	last.x, last.y = snake.head.x, snake.head.y
	snake.head.x, snake.head.y = x,y
	for i=1, #snake.tail.segment do
		local newlast = {}
		newlast.x, newlast.y = snake.tail.segment[i].x, snake.tail.segment[i].y
		snake.tail.segment[i].x, snake.tail.segment[i].y = last.x, last.y
		last.x, last.y = newlast.x, newlast.y
	end
end

snake.turn = function(direc)
	if isValidTurn(direc) and snake.turnLocked==false then
		snake.direction = direc
		snake.turnLocked = true
	end
end

snake.isHere = function(x,y)
	if(x == snake.head.x and y == snake.head.y) then
		return true
	else 
		for i=1,#snake.tail.segment do
			--print(x,y,snake.tail.segment[i].x,snake.tail.segment[i].y,x == snake.tail.segment[i].x and y == snake.tail.segment[i].y)
			if(x == snake.tail.segment[i].x and y == snake.tail.segment[i].y) then
				return true
			end
		end
		return false
	end
end

snake.isTail = function(x,y)
	for i=1,#snake.tail.segment do
		--print(x,y,snake.tail.segment[i].x,snake.tail.segment[i].y,x == snake.tail.segment[i].x and y == snake.tail.segment[i].y)
		if(x == snake.tail.segment[i].x and y == snake.tail.segment[i].y) then
			return true
		end
	end
	return false
end

snake.clear = function()
	snake.tail.segment = {}
	snake.head.x = constants.start.x
	snake.head.y = constants.start.y
	snake.direction = constants.start.direction
	local bS = constants.start.breakSize;
	local x = constants.start.size - 1
	for i=1,constants.start.size do
		if i < constants.start.breakSize then
			snake.tail.increaseTail(constants.start.x - i,constants.start.y)
			x = constants.start.x - i
		else
			snake.tail.increaseTail(x, constants.start.y - (i - bS))
		end
	end
end

return (snake)
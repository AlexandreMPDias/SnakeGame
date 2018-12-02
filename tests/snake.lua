s = require "../snake"
utils = require "../utils"
const = require "../constants"
direction = const.direction

local north = direction.toString(direction.north)
local south = direction.toString(direction.south)
local east = direction.toString(direction.east)
local west = direction.toString(direction.west)

local test = {}
test.made = 0
test.completed = 0

tests = {}

function asserting(obtainedValue, expected, result)
	if obtainedValue == nil then
		print('Asserting: Obtained Value is nil')
	elseif expected == nil then 
		print('Asserting: Expected value is nil\n')
	end
	if obtainedValue == expected then 
		return result
	else
		 print("Assert failed: Expected [".. tostring(expected).. "] but received [".. tostring(obtainedValue).."]")
		 if result == true then
			return false
		 end
		 return result
	end
	return result
end

function assertCoords(a,bx,by, result)
	r = asserting(a.x, bx, result)
	r = asserting(a.y, by, r)
	return r
end

function sample()

	result = true
	test.made = test.made + 1
	---

	---
	
	if result == true then
		test.completed = test.completed + 1
	else
		print("failed")
	end
end

function turn(snake,direction)
	snake.turnLocked = false
	snake.turn(direction)
end

-------------------- END OF HELPER

function makeSnake(size)
	for i=1,size do
		s.add(i,i)
	end
	return s
end

function teste_direction()

	result = true
	test.made = test.made + 1
	---

	snake.tail.increaseTail(15,15)
	snake.tail.increaseTail(14,15)
	snake.tail.increaseTail(13,15)
	
	snake.walk()
	snake.walk()
	
	result = asserting(direction.toString(snake.direction), east, result)
	snake.turnLocked = false
	snake.turn(direction.north)
	result = asserting(direction.toString(snake.direction), north, result)
	snake.turnLocked = false
	snake.turn(direction.north)
	result = asserting(direction.toString(snake.direction), north, result)
	snake.turnLocked = false
	snake.turn(direction.south)
	result = asserting(direction.toString(snake.direction), north, result)
	snake.turnLocked = false;
	snake.turn(direction.west)
	result = asserting(direction.toString(snake.direction), west, result)
	snake.turnLocked = false;
	snake.turn(direction.east)
	result = asserting(direction.toString(snake.direction), west, result)
	snake.turnLocked = false;
	snake.turn(direction.south)
	result = asserting(direction.toString(snake.direction), south, result)
	snake.turnLocked = false;
	snake.turn(direction.north)
	result = asserting(direction.toString(snake.direction), south, result)
	snake.turnLocked = false;
	snake.turn(direction.east)
	result = asserting(direction.toString(snake.direction), east, result)
	snake.turn(direction.south)
	result = asserting(direction.toString(snake.direction), east, result)

	snake.clear()

	---
	
	if result == true then
		test.completed = test.completed + 1
	else
		print("teste_direction failed")
	end
end

function teste_increase()

	result = true
	test.made = test.made + 1
	---

	snake.tail.increaseTail(15,15)
	snake.tail.increaseTail(14,15)
	result = assertCoords(snake.tail.getEndPosition(), 14 ,15, result)
	snake.tail.increaseTail(13,15)

	result = assertCoords(snake.tail.getEndPosition(), 13 ,15, result)


	snake.clear()

	---
	
	if result == true then
		test.completed = test.completed + 1
	else
		print("teste_increase failed")
	end
end

function teste_collision_with_self()

	result = true
	test.made = test.made + 1
	---

	for i=1,10 do
		snake.tail.increaseTail(15-i, 15)
	end

	turn(snake, south)
	result = asserting(snake.isTail(snake.head.x, snake.head.y), false, result)
	


	snake.clear()

	---
	
	if result == true then
		test.completed = test.completed + 1
	else
		print("teste_collision_with_self failed")
	end
end

teste_direction()
teste_increase()
teste_collision_with_self()

print("\n\nTest Results: [ "..test.completed .. "/" .. test.made.. " ]")
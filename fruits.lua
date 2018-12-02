fruits = {}
fruits.add = function (x,y)
	-- Adds the fruit to the Fruit array
	fruit = {}
	fruit.x,fruit.y = x,y
	table.insert(fruits, fruit)
end

fruits.pop = function()
	-- Removes the fruit from the fruit array
	-- for i=1,#fruits-1 do
	-- 	fruits[i] = fruits[i + 1]
	-- end
	table.remove(fruits, 1)
end

fruits.consume = function()
	-- Calculates and returns the score for consuming the fruit
	-- But doesnt remove the fruit from the array
	return 50
end

fruits.isEmpty = function()
	return #fruits < 1
end

fruits.getOldest = function()
	ar = {}
	ar.x = fruits[1].x
	ar.y = fruits[1].y
	return ar
end
	
fruits.getNewest = function()
	ar = {}
	ar.x = fruits[#fruits].x
	ar.y = fruits[#fruits].y
	return ar
end

fruits.isHere = function(x,y)
	for i=1,#fruits do
		if(fruits[i].x == x and fruits[i].y == y) then
			return true
		end
	end
	return false
end

fruits.clear = function()
	for i=1 , #fruits do
		table.remove(fruits,#fruits)
	end
end

-- for i=1,10 do
-- 	fruits.add(i,i)
-- end

-- fruits.pop()
-- fruits.pop()

-- for i=1,#fruits do
-- 	print(fruits[i].x, fruits[i].y)
-- end

-- print(fruits.getOldest().x, fruits.getOldest().y)

return (fruits)
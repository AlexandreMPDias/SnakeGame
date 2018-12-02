f = require "../fruits"
utils = require "../utils"

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

-------------------- END OF HELPER

function makeFruit(size)
	for i=1,size do
		f.add(i,i)
	end
	return f
end

function test_clear()
	result = true
	test.made = test.made + 1
	result = asserting(#f, 0,result)
	fruits = makeFruit(10)
	result = asserting(#f, 10,result)
	fruits.clear()
	result = asserting(#f, 0, result)
	result = asserting(fruits.isEmpty(), true, result)
	if result == true then
		test.completed = test.completed + 1
	else
		print("test_clear failed")
	end
end

function teste1()

	result = true
	test.made = test.made + 1


	fruits = makeFruit(10)
	fruits.pop()
	fruits.pop()

	for i=1,#fruits do
		--print(utils.exibeCoords(fruits[i]))
	end

	result=assertCoords(fruits.getOldest(), 3, 3,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)

	fruits.pop()

	result=assertCoords(fruits.getOldest(), 4, 4,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)

	fruits.pop()

	result=assertCoords(fruits.getOldest(), 5, 5,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)


	fruits.clear()

	if result == true then
		test.completed = test.completed + 1
	else
		print("teste1 failed")
	end
end

function teste()

	result = true
	test.made = test.made + 1
	---

	fruits = makeFruit(10)
	fruits.pop()
	fruits.pop()

	result=assertCoords(fruits.getOldest(), 3, 3,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)

	fruits.pop()

	result=assertCoords(fruits.getOldest(), 4, 4,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)

	fruits.pop()

	result=assertCoords(fruits.getOldest(), 5, 5,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)

	fruits.add()

	result=assertCoords(fruits.getOldest(), 5, 5,result)
	result=assertCoords(fruits.getNewest(), 11, 11,result)


	fruits.clear()
	

	---
	if result == true then
		test.completed = test.completed + 1
	else
		print("teste failed")
	end
end

function teste2()

	result = true
	test.made = test.made + 1
	---

	fruits = makeFruit(10)
	fruits.pop()
	fruits.pop()

	result=assertCoords(fruits.getOldest(), 3, 3,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)

	fruits.pop()

	result=assertCoords(fruits.getOldest(), 4, 4,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)

	fruits.pop()

	result=assertCoords(fruits.getOldest(), 5, 5,result)
	result=assertCoords(fruits.getNewest(), 10, 10,result)

	fruits.add(11,11)

	result=assertCoords(fruits.getOldest(), 5, 5,result)
	result=assertCoords(fruits.getNewest(), 11, 11,result)


	fruits.clear()
	

	---

	if result == true then
		test.completed = test.completed + 1
	else
		print("teste2 failed")
	end
end

function test_add()

	result = true
	test.made = test.made + 1
	---

	result = asserting(#f, 0, result)
	f.add(1,1)
	f.add(2,1)
	f.add(3,1)
	f.add(4,1)
	result = asserting(#f, 4, result)
	f.pop();f.pop();f.pop();f.pop();f.pop();f.pop()
	result = asserting(#f, 0, result)
	f.add(5,1)
	result = asserting(#f, 1, result)
	result=assertCoords(f.getNewest(), 5,1,result)


	---
	
	if result == true then
		test.completed = test.completed + 1
	else
		print("test_add failed")
	end
end











test_clear()
teste1()
teste2()
test_add()

print("\n\nTest Results: [ "..test.completed .. "/" .. test.made.. " ]")
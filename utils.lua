constants = require "constants"

utils = {}

function exibeCoords(aa)
	return '['..aa.x..' , '..aa.y..']'
end

function adjust(value)
	--print(value)
	return ((constants.view.innerMargin * value) + 0.5) * constants.view.scale
end

function drawRectangle(x,y,fill)
	if fill == nil then
		fill = "fill"
	end
	love.graphics.rectangle(fill, adjust(x-1), adjust(constants.map.size - y), constants.view.scale, constants.view.scale)
end

function drawCircle(x,y,fill)
	if fill == nil then
		fill = "fill"
	end
	love.graphics.circle(fill, adjust(x-1), adjust(constants.map.size - y), constants.view.scale)
end

utils.drawSnake = function(x,y, i)
	local resizer = (0.95 - 0.5) * math.pow(0.93,i) + 0.5-- 1/(1 + 0.01 * i)
	local size = constants.view.scale * resizer
	local offset = (constants.view.scale/2) * (1 - resizer)
	love.graphics.rectangle("fill", adjust(x-1) + offset, adjust(constants.map.size - y) + offset, size, size)
end

utils.printUnderSnake = function(obj)
	offsetX = adjust(obj.x-1)
	offsetY = adjust(constants.map.size - obj.y) + 1.1*constants.view.scale
	love.graphics.print(obj.x..","..obj.y, math.floor(offsetX), math.floor(offsetY))
end

utils.drawFruits = function(x,y, scale)
	local radius = constants.view.scale/2
	love.graphics.circle("line", adjust(x-1) + (radius), adjust(constants.map.size - y) + radius, scale  * radius)--, constants.view.scale * 1.1)
end

function border()
	x = adjust(0)
	y = adjust(0)
	w = adjust(constants.map.size - 1) + constants.view.scale/2
	h = adjust(constants.map.size - 1) + constants.view.scale/2
	love.graphics.rectangle("line", x,y, w,h)
end

function resize()
	love.window.setMode(adjust(constants.map.size) + constants.view.scale/2, adjust(constants.map.size) + constants.view.scale/2 + constants.view.offsetY)
end

function makeColor(hex, r, g, b)
	a = {}
	a.hex = hex
	a.rgb = { r/255 , g/255  , b/255 }
	return a
end

function compareCoords(a, b)
	return a.x == b.x and a.y == b.y
end

utils.adjust = adjust
utils.drawRectangle = drawRectangle
utils.makeColor = makeColor
utils.drawCircle = drawCircle
utils.border = border
utils.compareCoords = compareCoords
utils.exibeCoords = exibeCoords
utils.resize = resize

utils.resize()
return (utils)
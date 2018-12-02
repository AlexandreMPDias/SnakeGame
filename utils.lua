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
	love.graphics.rectangle(fill, adjust(x), adjust(constants.map.size - y), constants.view.scale, constants.view.scale)
end

function drawCircle(x,y,fill)
	if fill == nil then
		fill = "fill"
	end
	love.graphics.circle(fill, adjust(x), adjust(constants.map.size - y), constants.view.scale)
end

utils.drawSnake = function(x,y, i)
	local resizer = 1/(1 + 0.1*i)
	local size = constants.view.scale * resizer
	local offset = (constants.view.scale/2) * (1 - resizer)
	love.graphics.rectangle("fill", adjust(x) + offset, adjust(constants.map.size - y) + offset, size, size)
end

utils.drawFruits = function(x,y)
	local radius = constants.view.scale/2
	love.graphics.circle("line", adjust(x) + (radius), adjust(constants.map.size - y) + radius, 1.5  * radius)--, constants.view.scale * 1.1)
end

function border()
	x = adjust(1)
	y = adjust(0)
	w = adjust(constants.map.size)
	h = adjust(constants.map.size)
	love.graphics.rectangle("line", x,y, w,h)
end

function makeColor(hex, r, g, b)
	a = {}
	a.hex = hex
	a.rgb = { r , g  , b }
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
return (utils)
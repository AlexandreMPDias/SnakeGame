constants = require "constants"

utils = {}

function adjust(value)
	print(value)
	return ((constants.view.innerMargin * value) + 0.5) * constants.view.scale
end

function drawRectangle(x,y)
	love.graphics.rectangle("fill", adjust(x), adjust(constants.map.size - y), constants.view.scale, constants.view.scale)
end

function drawCircle(x,y)
	love.graphics.circle("fill", adjust(x), adjust(constants.map.size - y), constants.view.scale)
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

function exibeCoords(aa)
	return '['..aa.x..' , '..aa.y..']'
end

utils.adjust = adjust
utils.drawRectangle = drawRectangle
utils.makeColor = makeColor
utils.drawCircle = drawCircle
utils.border = border
utils.compareCoords = compareCoords
utils.exibeCoords = exibeCoords
return (utils)
constants = {}

direction = {}
direction.north = 0
direction.south= 1
direction.east = 2
direction.west = 3
direction.toString = function (direc)
	if direc == direction.north then return 'North'
	elseif direc == direction.south then return 'South'
	elseif direc == direction.east then return 'East'
	else return 'West'
	end
end

ids = {}
ids.fruit = "fruit"
ids.tail = "tail"
ids.snake = "snake"
ids.wall = "wall"
ids.nothing = "nothing"

map = {}
map.size = 30

start = {}
start.x = math.ceil(map.size/2)
start.y = math.ceil(map.size/2)
start.direction = direction.east
start.size = 3
start.breakSize = 5

game = {}
game.speed = 100 -- higher value = slower game
game.debugMode = true
game.grid = true

gameState = {}
gameState.running = "running"
gameState.paused = "paused"
gameState.after = "after"
gameState.menu = "menu"

view = {}
view.scale = 10
view.innerMargin = 1.1
view.offsetY = 100

controller = {}
controller.options = {}
controller.options.nodeMCU = 1
controller.options.keyboard = 2
controller.active = 1

constants.start = start
constants.direction = direction
constants.id = ids
constants.map = map
constants.view = view
constants.game = game
constants.controller = controller
constants.gameState = gameState
return(constants)
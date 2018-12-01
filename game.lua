game = {}

constants = require "constants"
game.world = require "world"

game.score = 0

function loadHighScore()

end

function updateHighscore(highscore)

end

game.reset = function()
	game.score = 0
	game.world.speed = constants.game.speed
	world.snake.clear()
	world.fruits.clear()
	world.snake.tail.increaseTail(world.snake.head.x - 1, world.snake.head.y)
	world.snake.tail.increaseTail(world.snake.head.x - 2, world.snake.head.y)
	world.snake.tail.increaseTail(world.snake.head.x - 2, world.snake.head.y - 1)
	world.generateRandomFruit()
end

return (game)
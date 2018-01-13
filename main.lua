require("collision")
require("controls")

function love.load()
	love.window.setFullscreen("true", "desktop")
	love.mouse.setVisible(false)
	introState = true

	width, height = love.graphics.getDimensions()
	widthMid, heightMid = width/2, height/2

	squareSize = 100
	score = 0

	squares = {
		player = {colors = {r = 0, g = 0, b = 150}},
		movable = {colors = {r = 150, g = 0, b = 0}},
		target = {colors = {r = 0, g = 150, b = 0}},
	}

	randomSquares()
end

function love.draw()
	if introState == true then
		love.graphics.setNewFont(40)
		love.graphics.print("You are the BLUE square.\n
			Your mission is to push the RED square to the GREEN one.\n
			The only rules are to stay on the screen\n
			and to stay away from the GREEN square.")
	else
		love.graphics.print("Score: "..score)
		love.graphics.setBackgroundColor(15, 15, 15)

		for _,square in pairs(squares) do
			love.graphics.setColor(square.colors.r, square.colors.g, square.colors.b)
			love.graphics.rectangle('fill', square.x, square.y, squareSize, squareSize)
		end
	end
end

function win()
	score = score + 1
	randomSquares()
end

function lose()
	score = score - 1
	randomSquares()
end

function randomCoordinates()
	x = math.random((width - squareSize*3) / squareSize + 1 ) * squareSize
	y = math.random((height - squareSize*3) / squareSize + 1) * squareSize
	return x, y
end

function randomSquares()
	squares.player.x, squares.player.y = randomCoordinates()
	squares.movable.x, squares.movable.y = randomCoordinates()
	squares.target.x, squares.target.y = randomCoordinates()

	while collisionCheck() do
		squares.player.x, squares.player.y = randomCoordinates()
		squares.movable.x, squares.movable.y = randomCoordinates()
		squares.target.x, squares.target.y = randomCoordinates()
	end
end

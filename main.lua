require("collision")
require("controls")
function love.load()
	love.window.setFullscreen('true', "desktop")
	love.mouse.setVisible(false)
	intro = true

	width, height = love.graphics.getDimensions()
	widthMid, heightMid = width/2, height/2

	squareSize = 100

	squares = {player = {score = 0}, movable = {}, target = {}}
	randomSquares()
end

function love.draw()
	if intro == true then
		love.graphics.setNewFont(40)
		love.graphics.print("You are the RED square.\nYour mission is to put the GREEN square in the BLUE one.\nThe only rules are to stay on the screen and to stay away from the BLUE square.")
	else
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("Score: "..squares.player.score)
		love.graphics.setBackgroundColor(30, 0, 5)
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle('fill', squareSize, squareSize, width - 2 * squareSize, height - 2 * squareSize)
		love.graphics.setColor(150, 0, 0)
		love.graphics.rectangle("fill", squares.player.x, squares.player.y, squareSize, squareSize)
		love.graphics.setColor(0, 150, 0)
		love.graphics.rectangle("fill", squares.movable.x, squares.movable.y, squareSize, squareSize)
		love.graphics.setColor(0, 0, 150)
		love.graphics.rectangle("fill", squares.target.x, squares.target.y, squareSize, squareSize)
	end
end

function win()
	squares.player.score = squares.player.score + 1
	randomSquares()
end

function lose()
	squares.player.score = squares.player.score - 1
	randomSquares()
end

function randomCoordinates()
	x, y = math.random((width - squareSize*3) / squareSize + 1 ) * squareSize, math.random((height - squareSize*3) / squareSize + 1) * squareSize
	return x, y
end

function randomSquares()
	squares.player.x, squares.player.y = randomCoordinates()
	squares.movable.x, squares.movable.y = randomCoordinates()
	squares.target.x, squares.target.y = randomCoordinates()

	while squares.movable.x == squares.player.x or squares.movable.y == squares.player.y do
		squares.movable.x, squares.movable.y = randomCoordinates()
	end

	while squares.movable.x == squares.target.x or squares.movable.y == squares.target.y or squares.target.x == squares.player.x or squares.target.y == squares.player.y do
		squares.target.x, squares.target.y = randomCoordinates()
	end
end

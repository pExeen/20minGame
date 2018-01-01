function collisionCheck()
	if squares.player.x == width
	or squares.player.x == 0 - squareSize
	or squares.player.y == height
	or squares.player.y == 0 - squareSize
	or (squares.player.x == squares.target.x and squares.player.y == squares.target.y) then
		return true
	end
end

function collision(direction)
	if collisionCheck() then
		lose()
	end
	if squares.movable.x == squares.target.x and squares.movable.y == squares.target.y then
		win()
	end
end

function movablePlayerCollision(coordinates, change)
	if squares.player.x == squares.movable.x and squares.movable.y == squares.player.y then
		load("squares.movable."..coordinates.." = squares.movable."..coordinates.." + "..change)()
	end
end

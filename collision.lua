function collision()
	if squares.player.x == width or squares.player.x == 0 - squareSize or squares.player.y == height or squares.player.y == 0 - squareSize or (squares.player.x == squares.target.x and squares.player.y == squares.target.y) then
		lose()
	end
	if squares.movable.x == squares.target.x and squares.movable.y == squares.target.y then
		win()
	end
end

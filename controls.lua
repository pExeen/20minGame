keys = {
	escape = love.event.quit,
	["return"] = function() introState = not introState end,
	r = randomSquares,
	move = function(key)
		local coordinate = ((key == "left") or (key == "right")) and "x" or ((key == "up") or (key == "down")) and "y"
		local change = ((key == "left") or (key == "up")) and -squareSize or ((key == "down") or (key == "right")) and squareSize 
		load("squares.player."..coordinate.." = squares.player."..coordinate.." + "..change)()
		if squares.player.x == squares.movable.x and squares.movable.y == squares.player.y then
			load("squares.movable."..coordinate.." = squares.movable."..coordinate.." + "..change)()
		end
		collision()
	end,
}

keys.left, keys.right, keys.up, keys.down = keys.move, keys.move, keys.move, keys.move

function love.keypressed( key )
	local action = keys[key]
	if action then  return action( key )  end
end

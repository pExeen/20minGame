function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
  if key == 'left' then
    squares.player.x = squares.player.x - squareSize
    if squares.player.x == squares.movable.x and squares.movable.y == squares.player.y then
      squares.movable.x = squares.movable.x - squareSize
    end
    collision()
  end

  if key == 'right' then
    squares.player.x = squares.player.x + squareSize
    if squares.player.x == squares.movable.x and squares.movable.y == squares.player.y then
      squares.movable.x = squares.movable.x + squareSize
    end
    collision()
  end

  if key == 'up' then
    squares.player.y = squares.player.y - squareSize
    if squares.player.y == squares.movable.y and squares.movable.x == squares.player.x then
      squares.movable.y = squares.movable.y - squareSize
    end
    collision()
  end

  if key == 'down' then
    squares.player.y = squares.player.y + squareSize
    if squares.player.y == squares.movable.y and squares.movable.x == squares.player.x then
      squares.movable.y = squares.movable.y + squareSize
    end
    collision()
  end
  if key == 'r' then
    randomSquares()
  end
  if key == 'escape' then
    love.event.quit()
  end
  if key == 'return' then
     intro = not intro
  end
end

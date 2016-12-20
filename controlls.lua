function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
  if key == 'left' then
    if playerX == blockX + rectenglesSize and blockY == playerY then
      blockX = blockX - rectenglesSize
    end
    playerX = playerX - rectenglesSize
  end

  if key == 'right' then
    if playerX == blockX - rectenglesSize and blockY == playerY then
      blockX = blockX + rectenglesSize
    end
    playerX = playerX + rectenglesSize
  end

  if key == 'up' then
    if playerY == blockY + rectenglesSize and blockX == playerX then
      blockY = blockY - rectenglesSize
    end
    playerY = playerY - rectenglesSize
  end

  if key == 'down' then
    if playerY == blockY - rectenglesSize and blockX == playerX then
      blockY = blockY + rectenglesSize
    end
    playerY = playerY + rectenglesSize
  end
  if key == 'r' then
    reset(playerX, playerY)
  end
  if key == 'escape' then
    love.event.quit()
  end
end

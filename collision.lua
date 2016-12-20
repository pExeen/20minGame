function collision()
  if ((blockX < 0 or playerX < 0) or
  (blockX > screenW or playerX > screenW) or
  (blockY < 0 or playerY < 0) or
  (blockY> screenH or playerY > screenH)or
  (playerX == randomGoalX and playerY == randomGoalY)) then
    reset()
    socre = 0
  end
  if blockX == randomGoalX and blockY == randomGoalY then
    win()
  end
end

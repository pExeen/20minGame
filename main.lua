

require 'collision'
require 'controlls'
function love.load()
  love.mouse.setVisible(false)
  rectenglesSize = 120
  screenW, screenH = love.graphics.getDimensions()
  screenWMid, screenHMid = screenW/2, screenH/2
  playerX = screenWMid
  playerY = 600
  blockX = screenWMid-2*rectenglesSize
  blockY = 600
  randomGoal()
  score = 0
end

function love.update(dt)
  collision()
end

function love.draw()
  love.graphics.setBackgroundColor(0, 150, 0)
  love.graphics.setColor(150, 0, 0)
  love.graphics.rectangle('fill', playerX, playerY, rectenglesSize, rectenglesSize)
  love.graphics.setColor(0, 0, 150)
  love.graphics.rectangle('fill', blockX, blockY, rectenglesSize , rectenglesSize)
  love.graphics.setColor(0, 150, 150)
  love.graphics.rectangle('fill', randomGoalX, randomGoalY, rectenglesSize, rectenglesSize)
  love.graphics.setNewFont(40)
  love.graphics.setColor(255, 255, 0)
  love.graphics.print(score, 0, 0)
end

function reset()
  playerX, playerY = screenWMid, 600
  blockX, blockY = screenWMid-2*rectenglesSize, 600
  randomGoal()
end

function boxCollision (box1X,  box1Y, box2X, box2Y)
  return   ( box1X == box2X and box1Y == box2Y )
end

function randomGoal()
  randomGoalX, randomGoalY = makeRandomGoal(rectenglesSize)
  if boxCollision(randomGoalX, randomGoalY, playerX, playerY) or
  boxCollision(randomGoalX, randomGoalY, blockX, blockY) then
    randomGoalX, randomGoalY = makeRandomGoal(rectenglesSize)
  end
end

function makeRandomGoal(rectenglesSize)
  return
  love.math.random(1, screenW/rectenglesSize-1) * rectenglesSize
  , love.math.random(1, screenH/rectenglesSize-1) * rectenglesSize
end

function win()
  score = score + 1
  reset()
end

function love.keypressed(key)
        if key == 'escape' then
                love.event.quit()
        end
        if key == 'left' then
                squares.player.x = squares.player.x - squareSize
                movablePlayerCollision('x', -squareSize)
                collision()
        end

        if key == 'right' then
                squares.player.x = squares.player.x + squareSize
                movablePlayerCollision('x', squareSize)
                collision()
        end

        if key == 'up' then
                squares.player.y = squares.player.y - squareSize
                movablePlayerCollision('y', -squareSize)
                collision()
        end

        if key == 'down' then
                squares.player.y = squares.player.y + squareSize
                movablePlayerCollision('y', squareSize)
                collision()
        end
        if key == 'r' then
                randomSquares()
        end
        if key == 'escape' then
                love.event.quit()
        end
        if key == 'return' then
                introState = not introState
        end
end

--function love.load()
    --print("game loaded")
--end

----------2---------
push = require 'push'         --3--
Class = require 'class'

require 'Player'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PLAYER_SPEED = 5

gameState= "title"

function love.load()
    io.stdout:setvbuf("no")
    love.graphics.setFont(love.graphics.newFont('8-bit-pusab.ttf', 16))
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    player1 = Player(20,40)
    player2 = Player(80,40)
end

----------3----------
function love.keypressed(key)
    if key=='escape' then
        love.event.quit()
    end

    if gameState == "title" then
         if key=='return' then
             gameState = "play"
    end
end
end

function love.update()

    if gameState=="play" then

    if love.keyboard.isDown('w') then
        player1.y= math.max(player1.y - PLAYER_SPEED, 0)
    elseif love.keyboard.isDown('s') then
        player1.y= math.min(player1.y + PLAYER_SPEED, VIRTUAL_HEIGHT - player1.height)
    end

    if love.keyboard.isDown('d') then
        player1.x= math.min(player1.x + PLAYER_SPEED, VIRTUAL_WIDTH - player1.width)
    elseif love.keyboard.isDown('a') then
        player1.x= math.max(player1.x - PLAYER_SPEED, 0)
    end


    if love.keyboard.isDown('up') then
        player2.y= math.max(player2.y - PLAYER_SPEED, 0)
    elseif love.keyboard.isDown('down') then
        player2.y= math.min(player2.y + PLAYER_SPEED, VIRTUAL_HEIGHT- player2.height)
    end

    if love.keyboard.isDown('right') then
        player2.x= math.min(player2.x + PLAYER_SPEED, VIRTUAL_WIDTH - player2.width)
    elseif love.keyboard.isDown('left') then
        player2.x= math.max(player2.x - PLAYER_SPEED, 0)
    end

    end
end



function love.draw()
    push:start()
    love.graphics.clear(10/255,0/255,60/255, 255/255)

    if gameState == 'title'then
    love.graphics.printf(
        'Welcome To My Game',
        0,
        VIRTUAL_HEIGHT /2 - 8,   --font aris 16 da zeda marcxena kutxit asworebs amito araa shuashi da -6 shuashi xdis
        VIRTUAL_WIDTH,
        'center')
    end

    player1:render()
    player2:render()
    
    push:finish()
    

end



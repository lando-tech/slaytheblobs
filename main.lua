function love.load()
    dungeon_floor = {}
    dungeon_floor.test = love.graphics.newImage("sprites/stone-tile.jpg")
    -- Load game images
    blob = love.graphics.newImage("sprites/blob.png")
    slayer = love.graphics.newImage("sprites/slayer.jpg")
    
    -- Load score, lives, and game timer
    score = 0
    health = 500.0
    timer = 120

    -- Set slayer starting coords
    slayer_x = 700
    slayer_y = 500

    -- Set blob starting coords
    blob_x = 100
    blob_y = 50
    
    -- Set font, color, and bg-color

    love.graphics.setBackgroundColor(255,255,255)

    -- Get slayer image dimensions
    slayerWidth, slayerHeight = slayer:getDimensions()

    -- Set scale factor for slayer
    local scaleFactor = 0.01
    sx = scaleFactor
    sy = scaleFactor

    -- Get blob image dimensions
    blobWidth, blobHeight = blob:getDimensions()

    -- Set scale factor for blob
    local blobSFactor = 0.1
    bx = blobSFactor
    by = blobSFactor

end

function love.update(dt)
    -- Update timer
    love.graphics.print("Time: " .. math.ceil(timer_update(dt)), 10, 50)

    -- Get keyboard input
    if love.keyboard.isDown("right") then
        slayer_x = slayer_x + 150 * dt
    end
    if love.keyboard.isDown("left") then
        slayer_x = slayer_x - 150 * dt
    end
    if love.keyboard.isDown("up") then
        slayer_y = slayer_y - 150 * dt
    end
    if love.keyboard.isDown("down") then
        slayer_y = slayer_y + 150 * dt
    end

    -- Get scaled dimensions of images
    local scaledSlayerWidth = slayerWidth * sx
    local scaledSlayerHeight = slayerHeight * sy
    local scaledBlobWidth = blobWidth * bx
    local scaledBlobHeight = blobHeight * by
    
    -- Check for collison, and redraw blob
    if checkCollision(slayer_x,
                      slayer_y,
                      scaledSlayerWidth,
                      scaledSlayerHeight,
                      blob_x,
                      blob_y,
                      scaledBlobWidth,
                      scaledBlobHeight) then

        health = health - 20
        if health <= 0 then
           break 
        end
        updated_pos = generate_random_position(scaledBlobWidth, scaledBlobHeight) 
        blob_x = updated_pos[1]
        blob_y = updated_pos[2]
        love.graphics.draw(blob, blob_x, blob_y, 0, bx, by)
        print("Updated position to : " .. blob_x .. "," .. blob_y)

    end
end

function love.draw()
    -- Draw images to canvas
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(dungeon_floor.test, 0, 0, 0)
    love.graphics.draw(slayer, slayer_x, slayer_y, 0, sx, sy)
    love.graphics.draw(blob, blob_x, blob_y, 0, bx, by)
    -- Print score and health
    love.graphics.setNewFont(20)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Score: " ..score, 10, 10)
    love.graphics.print("Health: " ..health, 10, 30)
    love.graphics.print("Time: " .. math.ceil(timer), 10, 50)

end

function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    -- Check for collision of objects
    return x1 < x2 + w2 and 
           x2 < x1 + w1 and
           y1 < y2 + h2 and
           y2 < y1 + h1
end

function distanceBetween(x1, y1, x2, y2)
    -- Calculate the distance between objects
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

function generate_random_position(width, height)
    -- Generate new positions within the confines of the window size and dimensions of the image 
    local new_x = math.random(width, love.graphics.getWidth() - width)
    local new_y = math.random(height, love.graphics.getHeight() - height)
    return {new_x, new_y}

end

function timer_update(dt)
    timer = timer - dt
    return timer
end

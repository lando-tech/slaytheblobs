
utils = {

    distanceBetween = function(x1, y1, x2, y2)
        -- Calculate the distance between objects
        return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
    end,

    checkCollision = function(x1, y1, w1, h1, x2, y2, w2, h2)
        -- Check for collision of objects
        return x1 < x2 + w2 and 
               x2 < x1 + w1 and
               y1 < y2 + h2 and
               y2 < y1 + h1
    end,

    windowDimensions = function()
        return love.graphics.getWidth(), love.graphics.getHeight() 
    end,

    generate_random_pos = function(w, h)
        local new_x = math.random(w, love.graphics.getWidth() - w)
        local new_y = math.random(w, love.graphics.getHeight() - h)
        return new_x, new_y
    end,

    update_timer = function(dt)
        timer = timer - dt
        return timer
    end,

    scaleImage = function(image, sFactor)
        local imageW = image:getWidth()
        local imageH = image:getHeight()
        W = imageW * sFactor
        H = imageH * sFactor
        return W, H
    end,
}

return utils

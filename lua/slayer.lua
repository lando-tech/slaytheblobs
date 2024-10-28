
local slayer = {}

function slayer.loadSlayer(image_path)
    return love.graphics.newImage(image_path)
end

function slayer.drawSlayer(image, x, y, radians, sx, sy, anchor_x, anchor_y)
    love.graphics.draw(image, x, y, radians, sx, sy, anchor_x, anchor_y)
end

slayer.attrib = {
    image_path = "sprites/player.png",
    x = 700,
    y = 500,
    w = nil,
    h = nil,
    scaleFactor = 0.1,
    sx = 0.1,
    sy = 0.1,
    scaledW = nil,
    scaledH = nil,
    health = 500.0,
    attack = 10,

}

return slayer

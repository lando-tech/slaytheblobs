
local slayer = {}

function slayer.loadSlayer(image_path)
    return love.graphics.newImage(image_path)
end

function slayer.drawSlayer(image, x, y, radians, sx, sy)
    love.graphics.draw(image, x, y, radians, sx, sy)
end

slayer.attrib = {
    image_path = "sprites/slayer.jpg",
    x = 700,
    y = 500,
    w = nil,
    h = nil,
    scaleFactor = 0.01,
    sx = 0.01,
    sy = 0.01,
    scaledW = nil,
    scaledH = nil,
    health = 500.0,
    attack = 10,

}

return slayer

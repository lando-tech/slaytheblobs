blob = {}

function blob.loadBlob(image_path)
    return love.graphics.newImage(image_path) 
end

function blob.drawBlob(image, x, y, radians, sx, sy)
    love.graphics.draw(image, x, y, radians, sx, sy) 
end

blob.attrib = {
    image_path = "sprites/blob.png",
    x = 100,
    y = 50,
    w = nil,
    h = nil,
    scaleFactor = 0.1,
    sx = 0.1,
    sy = 0.1,
    scaledW = nil,
    scaledH = nil,
    health = 1000,
    attack = 25,
}

return blob

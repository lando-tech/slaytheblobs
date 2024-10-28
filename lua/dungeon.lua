
dungeon = {}

function dungeon.loadDungeon(image_path)
    return love.graphics.newImage(image_path)    
end

function dungeon.DrawDungeon(tileImage, windowW, windowH, tileWidth, tileHeight, sx, sy)
    local numTilesX = math.ceil(windowW / tileWidth) % windowW
    local numTilesY = math.ceil(windowH / tileHeight) % windowH

    for y = 0, numTilesY - 1 do
        for x = 0, numTilesX - 1 do
            love.graphics.draw(tileImage, x * tileWidth, y * tileHeight, 0, sx, sy)
        end
    end
end
function dungeon.getScaledDims()
    
end

dungeon.attrib = {
    image_path = "sprites/stone-tile.jpg",
    scaleFactor = 0.05,
    sx = 0.05,
    sy = 0.05,
}

return dungeon

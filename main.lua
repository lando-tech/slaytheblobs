local utils = require("game_engine.utils")
local slayer = require("game_engine.slayer")
local blob = require("game_engine.blob")
local dungeon = require("game_engine.dungeon")
local crosshair = require("game_engine.cursor")

deltaTime = 0

function love.load()
    -- Get window dimensions
    windowW = love.graphics.getWidth()
    windowH = love.graphics.getHeight()
    -- Load game images
    tile = dungeon.loadDungeon(dungeon.attrib.image_path)
    slayerOne = slayer.loadSlayer(slayer.attrib.image_path)
    blobOne = blob.loadBlob(blob.attrib.image_path)
    arrowOne = love.graphics.newImage("sprites/arrow.jpg") 
    -- Get scaled dimensions
    blobW, blobH = utils.scaleImage(blobOne, blob.attrib.sx)
    slayerW, slayerH = slayerOne:getDimensions() 
    tileW, tileH = utils.scaleImage(tile, dungeon.attrib.sx)
    -- arrowW, arrowH = utils.scaleImage(arrowOne, arrow.attrib.scaleFactor)
    -- Load custom mouse/cursor
    love.mouse.setVisible(false)
    mouse = crosshair.loadCrosshair()
    mouseW, mouseH = utils.scaleImage(mouse, crosshair.attrib.scaleFactor)
    -- Init table for projectile
    arrows = {}
end

function love.update(dt)
    -- Pass delta time as global variable
    deltaTime = dt

    -- Get keyboard input
    if love.keyboard.isDown("d") then
      slayer.attrib.x = slayer.attrib.x + 150 * dt
    end
    if love.keyboard.isDown("a") then
      slayer.attrib.x = slayer.attrib.x - 150 * dt
    end
    if love.keyboard.isDown("w") then
      slayer.attrib.y = slayer.attrib.y - 150 * dt
    end
    if love.keyboard.isDown("s") then
      slayer.attrib.y = slayer.attrib.y + 150 * dt
    end

     -- Check for collison, and redraw blob
    if utils.checkCollision(
         slayer.attrib.x,
         slayer.attrib.y,
         slayerW,
         slayerH,
         blob.attrib.x,
         blob.attrib.y,
         blobW,
         blobH

     ) then
         slayer.attrib.health = slayer.attrib.health - 20
         blob.attrib.x, blob.attrib.y = utils.generate_random_pos(blobW, blobH)
    end

    for i, a in ipairs(arrows) do
        a.x = a.x + (math.cos(a.direction) * a.speed * dt)
        a.y = a.y + (math.sin(a.direction) * a.speed * dt)
    end
end

function love.draw()
    love.graphics.setBackgroundColor(255, 255, 255)

    dungeon.DrawDungeon(
        tile,
        windowW,
        windowH,
        tileW,
        tileH,
        dungeon.attrib.sx,
        dungeon.attrib.sy)

    slayer.drawSlayer(
        slayerOne,
        slayer.attrib.x,
        slayer.attrib.y,
        slayerMouseAngle(),
        nil,
        nil,
        slayerW / 2,
        slayerH / 2)

    blob.drawBlob(
        blobOne,
        blob.attrib.x,
        blob.attrib.y,
        0,
        blob.attrib.sx,
        blob.attrib.sy)

    local mouseX, mouseY = love.mouse.getPosition()

    love.graphics.draw(
        mouse,
        mouseX,
        mouseY,
        0,
        crosshair.attrib.sx,
        crosshair.attrib.sy)
    
    for i, a in ipairs(arrows) do
        love.graphics.draw(arrowOne, a.x, a.y, nil, a.sx, a.sy, a.w / 2, a.h / 2)
    end
end

function love.mousepressed(x, y, button)
	if button == 1 then
            spawnArrow()
	end
end

function love.keypressed(key, isrepeat)
    isrepeat = true
    if key == "space" then
        spawnArrow()
    end
end

function slayerMouseAngle()
    return math.atan2(
        slayer.attrib.y - love.mouse.getY(),
        slayer.attrib.x - love.mouse.getX()
        ) + math.pi
end

function spawnArrow()
    local arrow = {}
    arrow.x = slayer.attrib.x
    arrow.y = slayer.attrib.y
    arrow.sx = 0.01
    arrow.sy = 0.01
    arrow.speed = 300
    arrow.w, arrow.h = utils.scaleImage(arrowOne, 0.01)
    arrow.direction = slayerMouseAngle()
    table.insert(arrows, arrow)
end

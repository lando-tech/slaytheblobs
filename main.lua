local utils = require("game_engine.utils")
local slayer = require("game_engine.slayer")
local blob = require("game_engine.blob")
local dungeon = require("game_engine.dungeon")
local arrow = require("game_engine.weapons")
local crosshair = require("game_engine.cursor")

function love.load()
    -- Get window dimensions
    windowW = love.graphics.getWidth()
    windowH = love.graphics.getHeight()
    -- Load game images
    tile = dungeon.loadDungeon(dungeon.attrib.image_path)
    slayerOne = slayer.loadSlayer(slayer.attrib.image_path)
    blobOne = blob.loadBlob(blob.attrib.image_path)
    arrowOne = arrow.loadArrow()
    -- Get scaled dimensions
    blobW, blobH = utils.scaleImage(blobOne, blob.attrib.sx)
    slayerW, slayerH = utils.scaleImage(slayerOne, slayer.attrib.sx)
    tileW, tileH = utils.scaleImage(tile, dungeon.attrib.sx)
    arrowW, arrowH = utils.scaleImage(arrowOne, arrow.attrib.scaleFactor)
    -- Load custom mouse/cursor
    love.mouse.setVisible(false)
    mouse = crosshair.loadCrosshair()
    mouseW, mouseH = utils.scaleImage(mouse, crosshair.attrib.scaleFactor)
end

function love.update(dt)
    -- Check spacebar input for projectile
    function love.keyreleased(key, isrepeat)
    	  if key == "space" then
    	      isrepeat = true
            local MouseX, MouseY = love.mouse.getPosition()
            arrow.attrib.speed = 150
            if arrow.attrib.x < MouseX then
            	  arrow.attrib.x = math.min(arrow.attrib.x + arrow.attrib.speed * dt, MouseX)
            elseif arrow.attrib.x > MouseX then
            	  arrow.attrib.x = math.max(arrow.attrib.x - arrow.attrib.speed * dt, MouseX)
            end

            if arrow.attrib.y < MouseY then
                arrow.attrib.y = math.min(arrow.attrib.y + arrow.attrib.speed * dt, MouseY)
            elseif arrow.attrib.y > MouseY then
                arrow.attrib.y = math.max(arrow.attrib.y - arrow.attrib.speed * dt, MouseY)
            end
        end
    end
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
        0,
        slayer.attrib.sx,
        slayer.attrib.sy)

    blob.drawBlob(
        blobOne,
        blob.attrib.x,
        blob.attrib.y,
        0,
        blob.attrib.sx,
        blob.attrib.sy)

    arrow.drawArrow(
        arrowOne,
        arrow.attrib.x,
        arrow.attrib.y,
        0,
        arrow.attrib.sx,
        arrow.attrib.sy)
    local mouseX, mouseY = love.mouse.getPosition()
    love.graphics.draw(
        mouse,
        mouseX,
        mouseY,
        0,
        crosshair.attrib.sx,
        crosshair.attrib.sy)

end

function love.mousepressed(x, y, button)
	if button == 1 then
    return x, y
	end
end

function love.keypressed(key, isrepeat)
    isrepeat = true
    if key == "space" then
        arrow.attrib.x, arrow.attrib.y = love.mouse.getPosition()
    end
end

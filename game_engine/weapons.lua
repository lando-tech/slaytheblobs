local arrows = {}

function arrows.loadArrow()
  return love.graphics.newImage("sprites/arrow.jpg")	
end

function arrows.drawArrow(image, x, y, radians, sx, sy)
  love.graphics.draw(image, x, y, radians, sx, sy)
end

function arrows.Shoot(dt)
  arrow.attrib.x = arrow.attrib.x + math.cos(arrow.attrib.angle) * arrow.attrib.speed * dt
  arrow.attrib.y = arrow.attrib.y + math.sin(arrow.attrib.angle) * arrow.attrib.speed * dt
end

function arrows.spawnArrow(slayer_x, slayer_y)
    local arrow = {} 
    arrow.x = slayer_x
    arrow.y = slayer_y
    arrow.speed = 300
    arrow.direction = slayerMouseAngle()
    table.insert(arrows, arrow)
end

arrow.attrib = {
  image_path = "sprites/arrow.jpg",
  x = 250,
  y = 250,
  scaleFactor = 0.01,
  sx = 0.01,
  sy = 0.01,
  speed = 0,
  angle = 0,
  }

return arrows

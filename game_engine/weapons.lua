local arrow = {}

function arrow.loadArrow()
  return love.graphics.newImage("sprites/arrow.jpg")	
end

function arrow.drawArrow(image, x, y, radians, sx, sy)
  love.graphics.draw(image, x, y, radians, sx, sy)
end

function arrow.Shoot(dt)
  arrow.attrib.x = arrow.attrib.x + math.cos(arrow.attrib.angle) * arrow.attrib.speed * dt
  arrow.attrib.y = arrow.attrib.y + math.sin(arrow.attrib.angle) * arrow.attrib.speed * dt
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

return arrow

local crosshair = {}

function crosshair.loadCrosshair()
	return love.graphics.newImage("sprites/cursor.jpg")
end

function crosshair.drawCrosshair(image, x, y, radians, sx, sy)
  love.graphics.draw(image, x, y, radians, sx, sy)
end

crosshair.attrib = {
  image_path = "sprites/cursor.jpg",
  x = 0,
  y = 0,
  scaleFactor = 0.02,
  sx = 0.02,
  sy = 0.02,
}

return crosshair

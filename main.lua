io.stdout:setvbuf("no")

-- called once
function love.load()
	x = 100
	y = 50
	speed = 100
end

function love.update(dt)
	x = x + speed * dt
	y = y + speed * dt
end

function love.draw()
	love.graphics.rectangle("fill", x, y, 100, 100)
end
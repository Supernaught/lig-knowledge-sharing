io.stdout:setvbuf("no")

-- called once
function love.load()
	player = {
		x = 300,
		y = 500,
		speed = 10,
		width = 50,
		height = 50
	}
end

function love.update(dt)
	updateMovements()
end

function updateMovements() 
	if love.keyboard.isDown("left") then
		player.x = player.x - player.speed
	elseif love.keyboard.isDown("right") then
		player.x = player.x + player.speed
	end

	if love.keyboard.isDown("up") then
		player.y = player.y - player.speed
	elseif love.keyboard.isDown("down") then
		player.y = player.y + player.speed
	end
end

function love.draw()
	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end
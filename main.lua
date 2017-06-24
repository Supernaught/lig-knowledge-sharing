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

	bullets = {}

	bulletWidth = 30
	bulletHeight = 30
	bulletSpeed = 20
end

function love.update(dt)
	-- player movement
	updateMovements()

	-- update bullets
	for index, bullet in ipairs(bullets) do
		bullet.y = bullet.y - bulletSpeed
	end
end


function updateMovements() 
	if love.keyboard.isDown("left") then
		player.x = player.x - player.speed
	elseif love.keyboard.isDown("right") then
		player.x = player.x + player.speed
	end

	-- if love.keyboard.isDown("up") then
	-- 	player.y = player.y - player.speed
	-- elseif love.keyboard.isDown("down") then
	-- 	player.y = player.y + player.speed
	-- end
end

function love.draw()
	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

	for index, bullet in ipairs(bullets) do
		love.graphics.rectangle("fill", bullet.x, bullet.y, bulletWidth, bulletHeight)
	end
end

function love.keypressed(key)
	if key == "space" then
		newBullet = {x = player.x, y = player.y}
		table.insert(bullets, newBullet)
	end
end
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

	enemies = {
		{ x = 300, y = 0, speed = 2 },
		{ x = 100, y = 0, speed = 5 },
		{ x = 500, y = 0, speed = 3 },
	}

	enemyWidth = 60
	enemyHeight = 30
end


function love.update(dt)
	-- player movement
	updateMovements()

	-- update bullets
	for bulletIndex, bullet in ipairs(bullets) do
		bullet.y = bullet.y - bulletSpeed

		for enemyIndex, enemy in ipairs(enemies) do
			isColliding = checkCollision(
				bullet.x, bullet.y, bulletWidth, bulletHeight,
				enemy.x, enemy.y, enemyWidth, enemyHeight
			)

			if isColliding then
				table.remove(bullets, bulletIndex)
				table.remove(enemies, enemyIndex)
			end
		end
	end

	-- update enemies
	for index, enemy in ipairs(enemies) do
		enemy.y = enemy.y + enemy.speed
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

	-- draw bullets
	for index, bullet in ipairs(bullets) do
		love.graphics.rectangle("fill", bullet.x, bullet.y, bulletWidth, bulletHeight)
	end

	-- draw enemies
	for index, enemy in ipairs(enemies) do
		love.graphics.rectangle("fill", enemy.x, enemy.y, enemyWidth, enemyHeight)
	end
end

function love.keypressed(key)
	if key == "space" then
		newBullet = {x = player.x, y = player.y}
		table.insert(bullets, newBullet)
	end
end

function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
	     x2 < x1+w1 and
	     y1 < y2+h2 and
	     y2 < y1+h1
end
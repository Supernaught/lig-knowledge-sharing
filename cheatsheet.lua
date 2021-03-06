-- 1. rectangle -------------------
love.graphics.rectangle("fill", 100, 50, 100, 100)


-- 2. move rectangle -------------------
speed = 10
x = x + speed
y = y + speed
love.graphics.rectangle("fill", x, y, 100, 100)


-- 3. add keyboard input -------------------
if love.keyboard.isDown("left") then
	x = x - speed
elseif love.keyboard.isDown("right") then
	x = x + speed
end

if love.keyboard.isDown("up") then
	y = y - speed
elseif love.keyboard.isDown("down") then
	y = y + speed
end


-- 4. refactor player to object -------------------
player = {
	x = 100,
	y = 50,
	speed = 10,
	width = 100,
	height = 100
}

-- 5. add bullets
-- load
bullets = {
	{x = 10, y = 500},
	{x = 50, y = 500},
	{x = 100, y = 500},
	{x = 300, y = 500}
}

bulletWidth = 30
bulletHeight = 30
bulletSpeed = 20

-- update
for index, bullet in ipairs(bullets) do
	bullet.y = bullet.y - bulletSpeed
end

-- draw
for index, bullet in ipairs(bullets) do
	love.graphics.rectangle("fill", bullet.x, bullet.y, bulletWidth, bulletHeight)
end

-- 6. add shooting
function love.keypressed(key)
	if key == "space" then
		newBullet = {x = player.x, y = player.y}
		table.insert(bullets, newBullet)
	end
end

-- 7. add enemies (just copy paste bullets logic)
enemies = {
	{ x = 300, y = 0, speed = 2 },
	{ x = 100, y = 0, speed = 5 },
	{ x = 500, y = 0, speed = 3 },
}

enemyWidth = 60
enemyHeight = 30

-- 8. add bullet enemy collision
-- add this inside bullets update
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

-- add this helper  function
function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
	     x2 < x1+w1 and
	     y1 < y2+h2 and
	     y2 < y1+h1
end
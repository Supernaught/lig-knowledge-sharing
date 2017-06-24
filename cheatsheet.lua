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

-- 5. 
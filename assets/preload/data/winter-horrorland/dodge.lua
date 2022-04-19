
state = true;
shouldAdd = true;

function onUpdate(elapsed)
	if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') then
		objectPlayAnimation('dodge', 'Pressed', false);
	else
		objectPlayAnimation('dodge', 'nonPress', false);
	end
end

function onCreate()  --random shit lol
	makeAnimatedLuaSprite('dodge', 'dodge', 1150, 582.5);
	addAnimationByPrefix('dodge', 'nonPress', 'nonPress', 24, false);
	addAnimationByPrefix('dodge', 'Pressed', 'Pressed', 12, false);
	addLuaSprite('dodge', false);
	setObjectCamera('dodge', 'other');
end
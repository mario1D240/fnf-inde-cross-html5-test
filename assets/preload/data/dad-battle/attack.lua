state = true;
shouldAdd = true;
function onUpdate(elapsed)
	if (getMouseX('camHUD') > 1000 and getMouseX('camHUD') < 1130) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') then
		objectPlayAnimation('attack', 'Pressed', false);
	else
		objectPlayAnimation('attack', 'nonPress', false);
	end
end
function onCreate()  --random shit lol
	makeAnimatedLuaSprite('attack', 'attack', 1000, 582.5);
	addAnimationByPrefix('attack', 'nonPress', 'nonPress', 24, false);
	addAnimationByPrefix('attack', 'Pressed', 'Pressed', 12, false);
	addLuaSprite('attack', false);
	setObjectCamera('attack', 'other');
end
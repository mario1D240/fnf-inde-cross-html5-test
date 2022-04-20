function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    addCharacterToList('BFdodge', 'boyfriend')
end

function onEvent(name, value1, value2)
    if name == "Imp" then
	--Set values so you can dodge
	canDodge = true;
makeAnimatedLuaSprite('Bones', 'That',2660,450);
--120 140
	addAnimationByPrefix('Bones', 'Bones', 'BoiRun instance 2', 24, true);
	addLuaSprite('Bones', true);
--	setScrollFactor('Bones', 0.7, 1.1);
	objectPlayAnimation('Bones', 'Bones', true);
	doTweenX('Bones','Bones',-2300,4)
	runTimer('Died', 1.3);
	end
end

function onUpdate()
   if canDodge == true and (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') then
Dodged = true;
triggerEvent('Play Animation','dodge','BF');
runTimer('dodging', 0.9);
setProperty('boyfriend.specialAnim', true)
canDodge = false;
 end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'Died' and Dodged == false then
setProperty('health', 0);
elseif tag == 'Died' and Dodged == true then
Dodged = false
elseif tag == 'dodging' then
  triggerEvent('Play Animation','idle','BF')
 end
end
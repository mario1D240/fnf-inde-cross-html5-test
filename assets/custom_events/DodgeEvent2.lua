function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    addCharacterToList('BFdodge', 'boyfriend')
    precacheImage('boom')
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent2" then
	--Set values so you can dodge
	canDodge = true;
makeAnimatedLuaSprite('Bones', 'boom', getProperty('dad.x'), 450);
--120 140
playSound('shoot',0.5)
	addAnimationByPrefix('Bones', 'Bones', 'Had', 24, true);
	addAnimationByPrefix('Bones','idle','Burst')
	addLuaSprite('Bones', true);
--	setScrollFactor('Bones', 0.7, 1.1);
	objectPlayAnimation('Bones', 'Bones', true);
	doTweenX('boom','Bones',2400,1)
	runTimer('Died', 0.3);
	triggerEvent('Play Animation','boom','Dad')
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
doTweenX('Bones2','Bones',300,0.1)
objectPlayAnimation('Bones','idle',false);
elseif tag == 'Died' and Dodged == true then
Dodged = false
elseif tag == 'dodging' then
triggerEvent('Play Animation','idle','BF');
 end
end
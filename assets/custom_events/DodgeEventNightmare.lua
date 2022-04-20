function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    addCharacterToList('BFdodge', 'boyfriend')
end

function onEvent(name, value1, value2)
    if name == "DodgeEventNightmare" then
      playSound('alert')
	--Set values so you can dodge
	canDodge = true;
makeAnimatedLuaSprite('Bones', 'characters/DodgeMechsBS-shader', getProperty('boyfriend.x'), getProperty('boyfriend.y'));
--120 140
	addAnimationByPrefix('Bones', 'Bones', 'Alarm', 24, false);
	addLuaSprite('Bones', true);
--	setScrollFactor('Bones', 0.7, 1.1);
	objectPlayAnimation('Bones', 'Alarm', false);
	runTimer('Died', 1.3);
	end
end

function onUpdate()
   if canDodge == true and (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') then
Dodged = true;
triggerEvent('Change Character','bf','BFdodgenightmare');
runTimer('dodging', 0.9);
addAnimationByPrefix('Bones', 'Bones', 'Bones', 24, false);
objectPlayAnimation('Bones', 'Bones', false);
characterPlayAnim('boyfriend', 'idle', true);
setProperty('boyfriend.specialAnim', true)
playSound('sansattack')
canDodge = false;
 end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'Died' and Dodged == false then
setProperty('health', 0);
elseif tag == 'Died' and Dodged == true then
Dodged = false
elseif tag == 'dodging' then
triggerEvent('Change Character','bf','bfSansNightmare');
 end
end
function onCreate()
if boyfriendName == 'bfSans' then
addCharacterToList('BFdodge', 'boyfriend');
elseif boyfriendName == 'chara' then
addCharacterToList('CHARAdodge', 'boyfriend');
end
	Dodged = false;
    canDodge = false;
end
function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
	playSound('alert', 0.7);
	--Set values so you can dodge
	canDodge = true;
if boyfriendName == 'bfSans' then
makeAnimatedLuaSprite('Bones', 'characters/DodgeMechs', getProperty('boyfriend.x'), getProperty('boyfriend.y'));

elseif boyfriendName == 'chara' then
makeAnimatedLuaSprite('Bones', 'characters/Cardodge', getProperty('boyfriend.x'), getProperty('boyfriend.y'));
end
	addAnimationByPrefix('Bones', 'Bones', 'Alarm', 24, false);
	addLuaSprite('Bones', true);
	setScrollFactor('Bones', 0.7, 1.1);
	objectPlayAnimation('Bones', 'Alarm', false);
	runTimer('Died', 1.3);
addAnimationByPrefix('Bones', 'Bones', 'Bones', 24, false);
	end
end

function onUpdate()
   if canDodge == true and (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') then
Dodged = true;
if boyfriendName == 'bfSans' then
triggerEvent('Change Character','bf','BFdodge');
end
if boyfriendName == 'chara' then
triggerEvent('Change Character', 'bf', 'CHARAdodge')
end
runTimer('dodging', 0.9);
objectPlayAnimation('Bones', 'Bones', false);
characterPlayAnim('boyfriend', 'idle', true);
setProperty('boyfriend.specialAnim', true)
playSound('sansattack', 0.7);
canDodge = false;
 end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'Died' and Dodged == false then
setProperty('health', 0);
elseif tag == 'Died' and Dodged == true then
Dodged = false
elseif tag == 'dodging' then
if boyfriendName == 'BFdodge' then 
triggerEvent('Change Character','bf','bfSans');
end
if boyfriendName == 'CHARAdodge' then
triggerEvent('Change Character', 'bf', 'chara')
  end
 end
end
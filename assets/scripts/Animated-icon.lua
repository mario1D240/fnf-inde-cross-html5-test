function onCreate()
  if dadName == 'bendyNightmare' then
	makeAnimatedLuaSprite('animated icon', 'icons/Nightmare Bendy', getProperty('iconP2.x'), getProperty('iconP2.y'))
	addAnimationByPrefix('animated icon', 'idle', 'AnimBendy', 24, false)
	setObjectCamera('animated icon', 'hud')
	addLuaSprite('animated icon', true)
end
end
function onUpdate(elapsed)
  if dadName == 'bendyNightmare' then
	setObjectOrder('animated icon', getObjectOrder('iconP1') + 10)
	setProperty('animated icon.flipX', false)
	setProperty('animated icon.visible', true)
	setProperty('animated icon.x', getProperty('iconP2.x') - 30)
	setProperty('animated icon.angle', getProperty('iconP2.angle'))
	setProperty('animated icon.y', getProperty('iconP2.y') - 0)
	setProperty('animated icon.scale.x', getProperty('iconP2.scale.x') - 0)
	setProperty('animated icon.scale.y', getProperty('iconP2.scale.y') - 0)
	setProperty('animated icon.antialiasing',true)
	setProperty('iconP2.alpha', 0) 
        objectPlayAnimation('animated icon','idle');	
end
end
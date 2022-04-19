--Script Made by:
	--Zoe.exe :3
	--Angel(from Discord)
	--ImpostordeSus(Main Porter)

--Easy Scripts Angel said lol(Strings)
IntroSubTextSize = 40 
--size of the text for the Song Name.
IntroTagWidth = 25	
--Width of the box's tag thingy.

--for Creating Shit
function onCreate()
	--The Circle Thing
	makeAnimatedLuaSprite('intro', 'cup/intro/the_thing2.0', -20, -10);
	addAnimationByPrefix('intro', 'idle', 'BOO instance 1', 18, false)
	scaleObject('intro', 1.05, 1.05);
	setObjectCamera('intro', 'other');
	addLuaSprite('intro', false);

	--Kool Wallop
	makeAnimatedLuaSprite('ready', 'cup/intro/ready_wallop', -600, -50)
	screenCenter('ready', 0)
	--scaleObejct('ready', 0.9, 0.9)
	addAnimationByPrefix('ready', 'go', 'Ready? WALLOP!', 24, false)
	setObjectCamera('ready', 'hud')
	objectPlayAnimation('ready', 'go')
	addLuaSprite('ready', true)
	--for Increase LoadImage, better put this Kool Wallop in stage.lua(precache) <-----Zoe.exe

	--The Box Intro Song!

	makeLuaSprite('JukeBox', 'musicBar', 0-IntroTagWidth, 15)
	setObjectCamera('JukeBox', 'other')
	setProperty('JukeBox.y', 450);
	setProperty('JukeBox.alpha', 0.7);
	setProperty('JukeBox.x', 1400);
	addLuaSprite('JukeBox', true)

	--Text for Song Name
	if songName == 'Technicolor-Tussle' then
		makeLuaText('JukeBoxSubText', 'BLVKAROT - Technicolor Tussle', 0-IntroTagWidth, 60)
		setTextAlignment('JukeBoxSubText', 'left')
		setObjectCamera('JukeBoxSubText', 'other')
		setProperty('JukeBoxSubText.alpha', 0.7);
		setTextSize('JukeBoxSubText', IntroSubTextSize)
		setProperty('JukeBoxSubText.y', 450);
		setProperty('JukeBoxSubText.x', 1400);
		setTextFont('JukeBoxSubText', 'ZillaSlabBold.ttf')
		addLuaText('JukeBoxSubText')
	end
	if songName == 'Snake-Eyes' then
		makeLuaText('JukeBoxSubText', 'Mike Geno - Snake Eyes', 0-IntroTagWidth, 60)

		setTextAlignment('JukeBoxSubText', 'left')

		setObjectCamera('JukeBoxSubText', 'other')
		setProperty('JukeBoxSubText.alpha', 0.7);
		setTextSize('JukeBoxSubText', IntroSubTextSize)
		setProperty('JukeBoxSubText.y', 450);
		setProperty('JukeBoxSubText.x', 1400);
		setTextFont('JukeBoxSubText', 'ZillaSlabBold.ttf')
		addLuaText('JukeBoxSubText')
	end
	if songName == 'Knockout' or songName == 'Test' then
		makeLuaText('JukeBoxSubText', 'Orenji Music - Knockout', 0-IntroTagWidth, 60)

		setTextAlignment('JukeBoxSubText', 'left')

		setObjectCamera('JukeBoxSubText', 'other')
		setProperty('JukeBoxSubText.alpha', 0.7);
		setTextSize('JukeBoxSubText', 40)
		setProperty('JukeBoxSubText.y', 450);
		setProperty('JukeBoxSubText.x', 1400);
		setTextFont('JukeBoxSubText', 'ZillaSlabBold.ttf')
		addLuaText('JukeBoxSubText')
	end
	setObjectOrder('intro', 4)
	setObjectOrder('JukeBox', 2)
	setObjectOrder('ready', 1)
	setObjectOrder('camera', 3)
	setProperty('skipCountdown', true)
end

--For Song Intro Tween
function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInTwo', 'JukeBox', 550, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 630, 1, 'CircInOut')
	runTimer('JukeBoxWait', 6, 1)
end

--Timer Callback
function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutTwo', 'JukeBox', 1300, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', 1380, 1.5, 'CircInOut')
	end
	if tag == 'goodbyejuke' then
		removeLuaSprite('JukeBox', true)
		removeLuaText('JukeBoxSubText', true)
	end
end
--Removing Wallop
function onUpdate()
	if getProperty('ready.animation.curAnim.finished') then
		removeLuaSprite('ready', true)
		runTimer('goodbyejuke', 5)
	end
	if getProperty('intro.animation.curAnim.finished') then
		removeLuaSprite('intro', true)
	end
end
--Wallop Scaling
function onCreatePost()
	setProperty('ready.scale.x', 0.8)
	setProperty('ready.scale.y', 0.8)
end
----------------------------------------------------------
--Do Not Steal I am watching you :)
--RANDOM SOUND SHIT
function onStartCountdown()
	if songName == 'Snake-Eyes' or songName == 'Technicolor-Tussle' then
	randomshit = string.format('intros/normal/intro-%i', getRandomInt(1,5))
	end
	if songName == 'Knockout' then
	randomshit = string.format('intros/angry/intro-%i', getRandomInt(1,2))
	end
	playSound(randomshit)
	--setProperty('skipCountdown', true)
end


----to who uses thus script,please change name the name of the song(the data song of on week song idk)to work almost all of this
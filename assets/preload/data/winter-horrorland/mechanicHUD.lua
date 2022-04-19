function onCreate()
  --background
  makeLuaSprite('front','cup/attack',-600,200)
  setScrollFactor('front',0.0,0.0)
  scaleObject('front',1.0,1.0)
  makeLuaSprite('front2','cup/dodge',-620,400)
  setScrollFactor('front2',0.0,0.0)
  scaleObject('front2',1.0,1.0)
  addLuaSprite('front',true)
addLuaSprite('front2',true)
close(true);
end
local sprMarqData = {};

function removeMarqueeSprite(name)
	local sprData = sprMarqData[name];
	if (sprData) then
		for i = 0,copies,1 do
			local sprName = 'mqspr:'..name..'_'..i;
			removeLuaSprite(sprName, true);
		end
	end
end

function addMarqueeSprite(name, src, x, y, width, copies, speed, ontop)
	removeMarqueeSprite(name);
	local sprData = {};
	sprData.name = name;
	sprData.src = src;
	sprData.width = width;
	sprData.copies = copies;
	copies = copies - 1;
	for i = 0,copies,1 do
		local sprName = 'mqspr:'..name..'_'..i;
		makeLuaSprite(sprName, src, x, y);
		scaleObject(sprName, 2, 2);
		local offset = i * width;
		if (speed >= 0) then
			offset = 0 - offset;
		end
		setProperty(sprName..'.x', x + offset);
		setProperty(sprName..'.velocity.x', speed);
		addLuaSprite(sprName, ontop);
	end
	sprMarqData[name] = sprData;
end



function onCreate()
	makeLuaSprite('bg','Fall Guys/Escenario 2/Cielo_2', -900, -1300);
	setLuaSpriteScrollFactor('bg', 0.8, 0.8);
	addLuaSprite('bg',false);
	scaleObject('bg', 2, 2);
	
	makeLuaSprite('bg2','Fall Guys/Escenario 2/Puertas_2', -900, -1650+800);
	setLuaSpriteScrollFactor('bg2', 1, 1);
	addLuaSprite('bg2',false);
	scaleObject('bg2', 2, 2);
		
	makeLuaSprite('bg3','Fall Guys/Escenario 2/Piso_2', -900, -1650+2100);
	setLuaSpriteScrollFactor('bg3', 1, 1);
	addLuaSprite('bg3',false);
	scaleObject('bg3', 2, 2);
	
	makeAnimatedLuaSprite('FG1','Fall Guys/Escenario 2/YellowGuy', -600, 40-100);
	scaleObject('FG1', 2, 2);
	addAnimationByPrefix('FG1', 'idle', 'Yellow0', 24, true);
	objectPlayAnimation('FG1', 'idle', true);
	addLuaSprite('FG1', false);
	
	makeAnimatedLuaSprite('FG2','Fall Guys/Escenario 2/OrangeGuy', 560, 150-100);
	scaleObject('FG2', 2, 2);
	addAnimationByPrefix('FG2', 'idle', 'Orange0', 24, true);
	objectPlayAnimation('FG2', 'idle', true);
	addLuaSprite('FG2', false);
	
	makeAnimatedLuaSprite('FG3','Fall Guys/Escenario 2/BlueGuy', 1150, 90-100);
	scaleObject('FG3', 2, 2);
	addAnimationByPrefix('FG3', 'idle', 'Blue0', 24, true);
	objectPlayAnimation('FG3', 'idle', true);
	addLuaSprite('FG3', false);
	
	makeLuaSprite('bg4','Fall Guys/Escenario 2/Detalles_Puertas', -900, -150);
	setLuaSpriteScrollFactor('bg4', 1, 1);
	addLuaSprite('bg4',false);
	scaleObject('bg4', 2, 2.75);

	makeLuaSprite('black','Fall Guys/Escenario 2/blackb', -900, -1300);
	setProperty('black.alpha','0')
    scaleObject('black', 8, 8);
	addLuaSprite('black', false);

	addMarqueeSprite('bg5', 'Fall Guys/Escenario 2/Niebla_1', -800, -1700, 3000, 5, -50, true);
	addMarqueeSprite('bg6', 'Fall Guys/Escenario 2/Niebla_2', -900, -1850, 3000, 4, 30, false);

	makeLuaSprite('bg7','Fall Guys/Escenario 2/Iluminacion', -900, -1650);
	setLuaSpriteScrollFactor('bg7', 1, 1);
	addLuaSprite('bg7',true);
	scaleObject('bg7', 4, 4);
	setProperty('bg7.alpha', 0.25);
	setBlendMode('bg7', 'add');
end

function onCreatePost()
	for i = 0,5,1 do
		doTweenColor('nb1_'..i, 'mqspr:bg5_'..i, 'ff9999', 0.1, 'linear');
	end
	for i = 0,4,1 do
		doTweenColor('nb2_'..i, 'mqspr:bg6_'..i, 'ff9999', 0.1, 'linear');
	end
	setProperty('gf.alpha', 0.0);
end

function onStepHit()
	if curStep == 1408 then
		setProperty('black.alpha','0.5')
	end
	if curStep == 1664 then
		setProperty('black.alpha','0')
	end
end


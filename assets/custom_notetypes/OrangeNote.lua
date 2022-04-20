function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'OrangeNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'OBONE_assets'); 

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			end
		end
	end

end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'OrangeNote' then
		setProperty('health', -500);
	end
end
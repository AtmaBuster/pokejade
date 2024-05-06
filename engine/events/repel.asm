RepelWoreOffScript::
	opentext
	setval 0
	writemem wRepelType
	readmem wCurItem
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	writetext .RepelWoreOffText
	waitbutton
	closetext
	end

.RepelWoreOffText:
	text_far _RepelWoreOffText
	text_end

UseAnotherRepelScript::
	opentext
	setval 0
	writemem wRepelType
	readmem wCurItem
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	writetext .UseAnotherRepelText
	yesorno
	iffalse .done
	callasm DoItemEffect
.done
	closetext
	end

.UseAnotherRepelText:
	text_far _UseAnotherRepelText
	text_end

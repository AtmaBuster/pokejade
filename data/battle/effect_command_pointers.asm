MACRO command
	const \1_command
DEF \1 EQUS "db \1_command"
	dba BattleCommand_\1
ENDM

MACRO commandx
	const \1_command
DEF \1 EQUS "db \1_command,"
	dba BattleCommand_\1
ENDM

MACRO commandonly
	const \1_command
DEF \1 EQUS "db \1_command"
ENDM

; battle commands are defined in engine/battle/effect_commands.asm

	dw 0 ; padding

BattleCommandPointers:
; entries correspond to macros/scripts/battle_commands.asm
	const_def 1
	command checkturn
	command checkobedience
	command usedmovetext
	command doturn
	command critical
	command damagestats
	command stab
	command damagevariation ; 08
	command checkhit
	command lowersub
	command moveanimnosub
	command raisesub
	command failuretext
	command applydamage
	command criticaltext
	command supereffectivetext ; 10
	command checkfaint
	command buildopponentrage
	command poisontarget
	command sleeptarget
	command draintarget
	command eatdream
	command burntarget
	command freezetarget ; 18
	command paralyzetarget
	command selfdestruct
	command mirrormove
	command payday
	command conversion
	command resetstats
	command storeenergy
	command unleashenergy ; 20
	command forceswitch
	command endloop
	command flinchtarget
	command ohko
	command recoil
	command mist
	command focusenergy
	command confuse ; 28
	command confusetarget
	command heal
	command transform
	command screen
	command poison
	command paralyze
	command substitute
	command rechargenextturn ; 30
	command mimic
	command metronome
	command leechseed
	command splash
	command disable
	command cleartext
	command charge
	command checkcharge ; 38
	command traptarget
	command donothing
	command rampage
	command checkrampage
	command constantdamage
	command counter
	command encore
	command painsplit ; 40
	command snore
	command conversion2
	command lockon
	command sketch
	command defrostopponent
	command sleeptalk
	command destinybond
	command spite ; 48
	command falseswipe
	command healbell
	command heldflinch
	command triplekick
	command kickcounter
	command thief
	command arenatrap
	command nightmare ; 50
	command defrost
	command curse
	command protect
	command spikes
	command foresight
	command perishsong
	command startsandstorm
	command endure ; 58
	command checkcurl
	command rolloutpower
	command donothing2
	command furycutter
	command attract
	command happinesspower
	command present
	command damagecalc ; 60
	command frustrationpower
	command safeguard
	command checksafeguard
	command getmagnitude
	command batonpass
	command pursuit
	command clearhazards
	command healmorn ; 68
	command healday
	command healnite
	command hiddenpower
	command startrain
	command startsun
	command effectchance
	command switchturn
	command fakeout ; 70
	command bellydrum
	command psychup
	command rage
	command doubleflyingdamage
	command doubleundergrounddamage
	command mirrorcoat
	command checkfuturesight
	command futuresight ; 78
	command doubleminimizedamage
	command skipsuncharge
	command thunderaccuracy
	command teleport
	command beatup
	command ragedamage
	command resettypematchup
	command bidefailtext ; 80
	command raisesubnoanim
	command lowersubnoanim
	command beatupfailtext
	command clearmissdamage
	command movedelay
	command moveanim
	command tristatuschance
	command supereffectivelooptext ; 88
	command startloop
	command curl
	command libra
	command stealthrock
	command toxicspikes
	command gastroacid
	command incinerate
	command starthail ; 90
	command trickroom
	command checkleafguard
	command knockoff
	command tailwind
	command ingrain
	command roost
	command doubledivingdamage
	command commondamagemod ; 98
	command pluck
	command recycle
	command endeavor
	command simplestatus
	command wakeupslap
	command naturalgift
	command forceconsumeholditem

	commandx raisestat
	commandx lowerstat
	commandx forceraisestat
	commandx forcelowerstat
	commandx raisestathit
	commandx lowerstathit
	commandx raiseoppstat
	commandx loweroppstat
	commandx forceraiseoppstat
	commandx forceloweroppstat
	commandx raiseoppstathit
	commandx loweroppstathit

DEF NUM_EFFECT_COMMANDS EQU const_value - 1

DEF FIRST_MOVEARG_COMMAND EQU raisestat_command
DEF LAST_MOVEARG_COMMAND EQU loweroppstathit_command

	const_def $ff, -1
	commandonly endmove
	commandonly endturn

FarChangeStat:
; b containsstat to alter, or -1 if it should be read from the move script
	push af
	ld a, 2
	ld [wFailedMessage], a
	ld a, b
	inc b
	jr nz, .move_script_byte_ok
	farcall ReadMoveEffectCommand
.move_script_byte_ok
	ld [wChangedStat], a
	pop af
	ld b, a
	bit STAT_TARGET_F, b
	jr z, .player
	farcall HasOpponentFainted
	ret z
	jr z, .not_fainted
.player
	farcall HasUserFainted
	ret z
.not_fainted

	bit STAT_MISS_F, b
	jr z, .no_miss
	ld a, [wAttackMissed]
	and a
	jr z, .no_miss

	; attack missed
	bit STAT_SILENT_F, b
	ret nz
	farcall CheckAlreadyExecuted
	ret nz
	farcall AnimateFailedMove
	farjp GetFailureResultText

.no_miss
	bit STAT_SECONDARY_F, b
	jr z, .no_secondary
	ld a, [wEffectFailed]
	and a
	ret nz

.no_secondary
	bit STAT_TARGET_F, b
	jr nz, .is_target
	farcall GetUserAbility
	cp SIMPLE
	jr nz, .skip_simple_user
	call DoubleStatChange
	jmp .ability_done

.skip_simple_user
	cp CONTRARY
	jmp nz, .ability_done
	ld a, b
	xor STAT_LOWER
	ld b, a
	jmp .ability_done

.is_target
	; TO-DO ; Contrary / Mold Breaker
	;call GetOpponentAbility
	cp SIMPLE
	jr nz, .skip_simple_target
	call DoubleStatChange
	jmp .ability_done

.skip_simple_target
	cp CONTRARY
	jr nz, .no_target_contrary
	ld a, b
	xor STAT_LOWER
	ld b, a
.no_target_contrary
	push bc
	farcall CheckSubstituteOpp
	pop bc
	jr z, .check_lowering

	bit STAT_SILENT_F, b
	ret nz
	;farcall ShowAbilityActivation
	farcall CheckAlreadyExecuted
	ret nz
	farcall AnimateFailedMove
	farjp PrintButItFailed

.check_lowering
	bit STAT_LOWER_F, b
	jr z, .ability_done
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemySubStatus4]
	jr z, .got_guards
	ld a, [wPlayerSubStatus4]
.got_guards
	and SUBSTATUS_MIST
	jr z, .check_ability
	bit STAT_SILENT_F, b
	ret nz
	farcall CheckAlreadyExecuted
	ret nz
	;farcall ShowAbilityActivation
	farcall AnimateFailedMove
	ld hl, ProtectedByMistText
	jmp StdBattleTextbox

.check_ability
	;call GetOpponentAbility
	cp CLEAR_BODY
	jr z, .ability_immune
	cp WHITE_SMOKE
	jr z, .ability_immune
	cp HYPER_CUTTER
	ld c, ATTACK
	jr z, .ability_check
	cp BIG_PECKS
	ld c, DEFENSE
	jr z, .ability_check
	cp KEEN_EYE
	ld c, ACCURACY
	jr z, .ability_check
	cp ILLUMINATE
	jr nz, .ability_done
.ability_check
	ld a, [wChangedStat]
	and $f
	cp c
	jr nz, .ability_done
.ability_immune
	bit STAT_SILENT_F, b
	ret nz
	farcall CheckAlreadyExecuted
	ret nz
	;farcall ShowAbilityActivation
	;farcall DisableAnimations
	;farcall ShowOpponentAbilityActivation
	farcall AnimateFailedMove
	ld hl, DoesntAffectText
	call StdBattleTextbox
	;farjp EnableAnimations
	ret

.ability_done
	bit STAT_TARGET_F, b
	call nz, SwitchTurn
	push bc
	bit STAT_LOWER_F, b
	jr nz, .lower
	call DoRaiseStat
	jr .stat_done
.lower
	call DoLowerStat
.stat_done
	ld a, [wChangedStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	pop bc
	bit STAT_TARGET_F, b
	call nz, SwitchTurn
	ld a, [wFailedMessage]
	and a
	jr z, .check_anim
	bit STAT_SILENT_F, b
	ret nz
	push bc
	;farcall ShowAbilityActivation
	ld c, 60
	call DelayFrames
	pop bc
	ld hl, WontRiseAnymoreText
	ld de, WontDropAnymoreText
	or 1
	jr DoPrintStatChange

.check_anim
	bit STAT_SKIPTEXT_F, b
	ret nz
	bit STAT_SILENT_F, b
	push bc
	jr nz, .anim_done
	call StatUpDownAnim
.anim_done
	;farcall ShowAbilityActivation
	pop bc
PrintStatChange:
	call GetStatRaiseMessage
DoPrintStatChange:
	push af
	and a
	call z, PlayStatChangeAnim
	pop af

	bit STAT_TARGET_F, b
	jr z, .do_print
	push af
	call SwitchTurn
	pop af
	call .do_print
	jmp SwitchTurn

.do_print
	bit STAT_LOWER_F, b
	jr z, .printmsg
	ld h, d
	ld l, e
	push af
	push bc
	call StdBattleTextbox
	pop bc
	pop af
	bit STAT_TARGET_F, b
	ret z
	and a
	ret nz
	ld a, [wAlreadyExecuted]
	push af
	;farcall RunStatIncreaseAbilities
	pop af
	ld [wAlreadyExecuted], a
	xor a
	ld [wFailedMessage], a
	ret

.printmsg
	jmp StdBattleTextbox

DoubleStatChange:
	push bc
	ld a, [wChangedStat]
	and $f0
	swap a
	inc a
	add a
	dec a
	cp $10
	jr c, .ok_change
	ld a, $0f
.ok_change
	swap a
	ld b, a
	ld a, [wChangedStat]
	and $0f
	or b
	ld [wChangedStat], a
	pop bc
	ret

GetStatRaiseMessage:
	ld a, [wChangedStat]
	and $f0
	swap a
	and a
	ld hl, StatRoseText
	ld de, StatFellText
	ret z
	dec a
	ld hl, StatRoseSharplyText
	ld de, StatFellHarshlyText
	ret z
	ld hl, StatRoseDrasticallyText
	ld de, StatFellSeverelyText
	xor a
	ret

UseStatItemText: ; TO-DO
	ret

GetStatName:
	ld hl, StatNames
	ld c, "@"
.CheckName:
	dec b
	jr z, .Copy
.GetName:
	ld a, [hli]
	cp c
	jr z, .CheckName
	jr .GetName

.Copy:
	ld de, wStringBuffer2
	ld bc, STRING_BUFFER_LENGTH
	jmp CopyBytes

INCLUDE "data/battle/stat_names.asm"

DoLowerStat:
	or 1
	jr DoChangeStat
DoRaiseStat:
	xor a
DoChangeStat:
	push af
	xor a
	ld [wFailedMessage], a
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerStatLevels
	jr z, .got_stat_levels
	ld hl, wEnemyStatLevels
.got_stat_levels
	ld a, [wChangedStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc

	ld a, [wChangedStat]
	and $f0
	swap a
	inc a
	ld c, a
	pop af
	jr nz, .lower_loop

.raise_loop
	ld a, [hl]
	cp MAX_STAT_LEVEL
	jr z, .stat_change_done
	inc [hl]
	inc b
	dec c
	jr nz, .raise_loop
	jr .stat_change_done

.lower_loop
	ld a, [hl]
	dec a
	jr z, .stat_change_done
	dec [hl]
	inc b
	dec c
	jr nz, .lower_loop

.stat_change_done
	ld a, b
	and a
	jr z, .stat_change_failed
	dec b
	swap b
	ld a, [wChangedStat]
	and $f
	or b
	ld [wChangedStat], a
	ret

.stat_change_failed
	ld a, 1
	ld [wFailedMessage], a
	ret

PlayStatChangeAnim:
	ret ; TO-DO
	farcall CheckBattleScene
	ret c
	bit STAT_LOWER_F, b
	ret z
	push hl
	push de
	push bc
	ldh a, [hBattleTurn]
	and a
	ld de, ANIM_PLAYER_STAT_DOWN
	jr z, .got_anim
	ld de, ANIM_ENEMY_STAT_DOWN
.got_anim
	farcall PlayFXAnimID
	jmp PopBCDEHL

StatUpDownAnim:
	farcall CheckBattleScene
	ret c

	farcall CheckAlreadyExecuted
	ret nz

	xor a
	ld [wNumHits], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	farcall SetMoveAnimationID
	farjp PlaySelectedFXAnim

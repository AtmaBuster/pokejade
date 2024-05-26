MACRO playerstat16
PlayerStats_\1:
	push de
	ld de, wPlayerStat_\1
	call PlayerStats_Inc16
	pop de
	ret
ENDM

MACRO playerstat32
PlayerStats_\1:
	push de
	ld de, wPlayerStat_\1
	call PlayerStats_Inc32
	pop de
	ret
ENDM

PlayerStats_PrizeMoney:
	push de
	ld a, [bc]
	ld e, a
	dec bc
	ld a, [bc]
	ld b, a
	ld c, e
	ld de, wPlayerStat_PrizeMoney
	call PlayerStats_AddBC32
	pop de
	ret

PlayerStats_HallOfFame:
	push de
	ld a, BANK(wPlayerStat_HallOfFame)
	ld hl, wPlayerStat_HallOfFame
	call GetFarWRAMByte
	and a
	ld de, wPlayerStat_FirstHallOfFameTime
	call z, PlayerStats_CopyPlayTime
	ld de, wPlayerStat_MostRecentHallOfFameTime
	call PlayerStats_CopyPlayTime
	ld de, wPlayerStat_HallOfFame
	call PlayerStats_Inc8
	pop de
	ret

PlayerStats_Splash:
	ldh a, [hBattleTurn]
	and a
	ret nz
	push de
	ld de, wPlayerStat_Splash
	call PlayerStats_Inc16
	pop de
	ret

PlayerStats_Selfdestruct:
	ldh a, [hBattleTurn]
	and a
	ret nz
	push de
	ld de, wPlayerStat_Selfdestruct
	call PlayerStats_Inc16
	pop de
	ret

	playerstat16 Healing
	playerstat16 Battles
	playerstat16 TrainerBattles
	playerstat16 WildBattles
	playerstat16 LinkBattles
	playerstat16 ColosseumDraws
	playerstat16 ColosseumWins
	playerstat16 ColosseumLosses
	playerstat16 FishingBattles
	playerstat16 BerriesPicked
	playerstat16 SurfUsed
	playerstat16 WaterfallUsed
	playerstat16 TreeBattles
	playerstat16 WhiteOuts
	playerstat16 MonsCaught
	playerstat16 Trades
	playerstat16 TMsHMsUsed
	playerstat16 MysteryGift
	playerstat32 StepCount
	playerstat16 EggsHatched
	playerstat16 MonsEvolved
	playerstat16 FlyUsed

MACRO pushwrambank
	ldh a, [rSVBK]
	push af
	ld a, \1
	ldh [rSVBK], a
ENDM

MACRO popwrambank
	pop af
	ldh [rSVBK], a
ENDM
PlayerStats_Inc8:
	pushwrambank BANK(wPlayerStatistics)
	ld a, [de]
	cp -1
	jr z, .max
	inc a
	ld [de], a
.max
	popwrambank
	ret

PlayerStats_Inc16:
	pushwrambank BANK(wPlayerStatistics)
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	and l
	cp -1
	jr z, .max
	ld a, [de]
	ld h, a
	inc hl
	ld a, h
	ld [de], a
	dec de
	ld a, l
	ld [de], a
.max
	popwrambank
	ret

PlayerStats_Inc32:
	pushwrambank BANK(wPlayerStatistics)
; check if it's maxed
	push de
	ld a, [de]
	cp -1
	jr nz, .got_max_status
	inc de
	ld a, [de]
	cp -1
	jr nz, .got_max_status
	inc de
	ld a, [de]
	cp -1
	jr nz, .got_max_status
	inc de
	ld a, [de]
	cp -1
.got_max_status
	pop de
	jr z, .max
; increment
	push hl
	ld h, d
	ld l, e

	inc [hl]
	jr nz, .done
	inc hl
	inc [hl]
	jr nz, .done
	inc hl
	inc [hl]
	jr nz, .done
	inc hl
	inc [hl]
.done
	pop hl
.max
	popwrambank
	ret

PlayerStats_AddBC32:
	pushwrambank BANK(wPlayerStatistics)
; check if it's maxed
	push de
	ld a, [de]
	cp -1
	jr nz, .got_max_status
	inc de
	ld a, [de]
	cp -1
	jr nz, .got_max_status
	inc de
	ld a, [de]
	cp -1
	jr nz, .got_max_status
	inc de
	ld a, [de]
	cp -1
.got_max_status
	pop de
	jr z, .max
; increment
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	dec de
	add hl, bc
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	jr nc, .done
	inc de
	ld a, [de]
	adc 0
	ld [de], a
	jr nc, .done
	inc de
	ld a, [de]
	adc 0
	ld [de], a
	jr nc, .done
; overflow
	ld a, -1
	ld [de], a
	dec de
	ld [de], a
	dec de
	ld [de], a
	dec de
	ld [de], a
.done
.max
	popwrambank
	ret

PlayerStats_CopyPlayTime:
; copies hours, minutes, and seconds to de
	ld hl, wGameTime + 4
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a
	push bc
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a

	pushwrambank BANK(wPlayerStatistics)
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	pop af
	pop bc
	push af
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	popwrambank
	ret

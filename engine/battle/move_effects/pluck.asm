BattleCommand_pluck:
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonItem
	jr z, .go
	ld hl, wBattleMonItem
.go
	ret ; TO-DO

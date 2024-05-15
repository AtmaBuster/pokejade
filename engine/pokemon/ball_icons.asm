LoadBallIcon:
	ld b, a
	add a
	add b
	ld l, a
	ld h, 0
	ld bc, BallIconPointers
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, vTiles2 tile $79
	ld c, 4
	jmp Get2bppViaHDMA

BallIconPointers:
	dba MasterBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon
	dba PokeBallMenuIcon

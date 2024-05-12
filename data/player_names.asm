ChrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1 ; default option
	db 0 ; ????

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
	db "???@"
	db "???@"
	db "???@"
	db "???@"
	db 2 ; title indent
	db " NAME @" ; title

KrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1 ; default option
	db 0 ; ????

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
	db "JADE@"
	db "???@"
	db "???@"
	db "???@"
	db 2 ; title indent
	db " NAME @" ; title

RivalNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1 ; default option
	db 0 ; ????

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
	db "JASPER@"
	db "???@"
	db "???@"
	db "???@"
	db 2 ; title indent
	db " NAME @" ; title

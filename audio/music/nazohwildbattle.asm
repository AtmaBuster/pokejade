Music_NazohWildBattle:
	channel_count 3
	channel 1, Music_NazohWildBattle_Ch1
	channel 2, Music_NazohWildBattle_Ch2
	channel 3, Music_NazohWildBattle_Ch3

Music_NazohWildBattle_Ch1:
	stereo_panning TRUE, TRUE
	tempo 98
	volume_envelope 7, 7
	duty_cycle 3
	vibrato 18, 1, 5
	note_type 12, 10, 2
	octave 5
.loop0:
	sound_call .sub1
	sound_loop 8, .loop0
	octave 4
.loop1:
	note G_, 6
	sound_loop 4, .loop1
	note G#, 4
	volume_envelope 10, 7
	note G#, 4
	volume_envelope 10, 2
.loop2:
	note G_, 6
	sound_loop 4, .loop2
	note G_, 4
	volume_envelope 10, 7
	note F_, 4
	volume_envelope 10, 2
	sound_ret
.sub1:
	octave 5
	note G_, 2
	note F#, 2
	note G_, 2
	octave 6
	note C_, 2
	octave 5
	sound_ret


Music_NazohWildBattle_Ch2:
	stereo_panning TRUE, TRUE
	duty_cycle 3
	vibrato 8, 3, 6
	note_type 12, 12, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 1
	note B_, 1
	octave 4
	note D#, 2
	octave 3
	note D#, 1
	note A#, 1
	octave 4
	note D_, 2
	octave 3
	note D_, 1
	note A_, 1
	octave 4
	note C#, 2
	octave 3
	note C#, 1
	note G#, 1
	octave 4
	note C_, 2
	octave 3
	note C_, 1
	note G_, 1
	note B_, 2
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	note A#, 2
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	note A_, 1
	octave 2
	note A_, 1
	octave 3
	note A_, 1
	note A#, 1
	octave 3
	note A_, 6
	note E_, 6
	note A_, 4
	note A#, 2
	octave 4
	note C_, 4
	note D_, 4
	note D_, 2
	octave 3
	volume_envelope 12, 4
	note A#, 4
	volume_envelope 12, 2
	note A_, 6
	note E_, 6
	note A_, 4
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	note G_, 2
	volume_envelope 12, 4
	note G#, 4
	volume_envelope 12, 2
	octave 4
	note A_, 6
	note E_, 6
	note A_, 4
	note A#, 2
	octave 5
	note C_, 4
	note D_, 4
	note D_, 2
	octave 4
	volume_envelope 12, 4
	note A#, 4
	volume_envelope 12, 2
	note A_, 6
	note E_, 6
	note A_, 4
	note A#, 2
	octave 5
	note C_, 4
	octave 4
	note G_, 4
	note G_, 2
	volume_envelope 12, 4
	note A#, 4
	volume_envelope 12, 2
.mainloop:
	volume_envelope 12, 7
	octave 4
	note E_, 1
	note D#, 1
	note E_, 10
	octave 3
	note A_, 1
	rest 1
	note A_, 6
	note A#, 4
	octave 4
	note C_, 4
	note E_, 4
	note D_, 2
	octave 3
	note A#, 1
	rest 3
	note A#, 10
	octave 4
	note F_, 2
	note D_, 1
	rest 3
	note D_, 4
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	octave 3
	note A_, 1
	rest 1
	note A_, 8
	octave 4
	note C_, 1
	note D_, 1
	note E_, 4
	note F_, 4
	note E_, 4
	note A_, 4
	note A#, 2
	note F_, 1
	rest 3
	octave 5
	note D_, 6
	note F_, 4
	note E_, 1
	note F_, 1
	note E_, 10
	octave 4
	note A#, 4
	volume_envelope 10, 4
	note A_, 8
	rest 8
	rest 12
	rest 2
	volume_envelope 12, 7
	note G_, 1
	note G#, 1
	note A_, 4
	note A#, 4
	octave 5
	note C#, 4
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	octave 4
	note A#, 2
	note A_, 4
	note E_, 4
	note D_, 4
	note E_, 1
	note F_, 1
	note E_, 2
	note D_, 4
	note F_, 4
	note E_, 4
	note D_, 4
	note C#, 4
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 2
	note A_, 6
	note G_, 1
	note G#, 1
	note A_, 4
	note A#, 4
	octave 4
	note C#, 4
	note G_, 4
	note F_, 4
	note F_, 1
	note G_, 1
	note F_, 2
	note E_, 4
	note D_, 1
	note E_, 1
	note D_, 2
	note C#, 4
	note E_, 4
	note F_, 4
	note G_, 1
	note A_, 1
	note G_, 2
	note F_, 4
	note G_, 4
	note A_, 6
	note G_, 1
	note G#, 1
	note A_, 4
	note A#, 4
	octave 5
	note C#, 4
	note F_, 4
	note E_, 4
	note D_, 1
	note E_, 1
	note D_, 2
	note C#, 4
	octave 4
	note A#, 4
	note G_, 4
	note A_, 4
	note A#, 4
	octave 5
	note C#, 4
	octave 4
	note A#, 4
	note A#, 1
	octave 5
	note C#, 1
	octave 4
	note A#, 2
	note A_, 6
	octave 3
	note G_, 1
	note G#, 1
	note A_, 4
	note A#, 4
	octave 4
	note C#, 4
	note G_, 4
	note F_, 4
	note F_, 1
	note G_, 1
	note F_, 2
	note E_, 4
	note D_, 1
	note E_, 1
	note D_, 2
	note C#, 4
	note E_, 4
	note F_, 4
	note G_, 1
	note A_, 1
	note G_, 2
	note F_, 4
	note E_, 1
	note F_, 1
	note E_, 2
	octave 3
	note A_, 6
	octave 4
	note G_, 1
	note G#, 1
	volume_envelope 12, 4
	note A_, 8
	octave 3
	volume_envelope 12, 8
	note E_, 4
	volume_envelope 12, 7
	note E_, 16
	note E_, 4
	note F_, 12
	note G_, 4
	note E_, 16
	octave 4
	volume_envelope 12, 4
	note A_, 8
	octave 3
	volume_envelope 12, 8
	note E_, 4
	volume_envelope 12, 7
	note E_, 16
	note C#, 4
	note D_, 12
	note E_, 1
	note F_, 1
	note E_, 2
	note E_, 16
	octave 4
	volume_envelope 12, 4
	note A_, 8
	volume_envelope 12, 8
	note E_, 4
	volume_envelope 12, 7
	note E_, 16
	note E_, 4
	note F_, 12
	note G_, 4
	note E_, 16
	volume_envelope 12, 4
	note A_, 8
	volume_envelope 12, 8
	note E_, 4
	volume_envelope 12, 7
	note E_, 16
	note C#, 4
	note D_, 8
	note A#, 8
	note A_, 8
	octave 3
	note A_, 8
	octave 3
	volume_envelope 12, 2
	note A_, 6
	note E_, 6
	note A_, 4
	note A#, 2
	octave 4
	note C_, 4
	note D_, 4
	note D_, 2
	octave 3
	volume_envelope 12, 4
	note A#, 4
	volume_envelope 12, 2
	note A_, 6
	note E_, 6
	note A_, 4
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	note G_, 2
	volume_envelope 12, 4
	note G#, 4
	volume_envelope 12, 2
	octave 4
	note A_, 6
	note E_, 6
	note A_, 4
	note A#, 2
	octave 5
	note C_, 4
	note D_, 4
	note D_, 2
	octave 4
	volume_envelope 12, 4
	note A#, 4
	volume_envelope 12, 2
	note A_, 6
	note E_, 6
	note A_, 4
	note A#, 2
	octave 5
	note C_, 4
	octave 4
	note G_, 4
	note G_, 2
	volume_envelope 12, 4
	note A#, 4
	volume_envelope 12, 2
	sound_loop 0, .mainloop


Music_NazohWildBattle_Ch3:
	vibrato 22, 2, 4
	note_type 12, 1, 9
	stereo_panning TRUE, TRUE
	octave 2
	note A_, 2
	octave 3
	note A_, 1
	rest 1
	octave 2
	note G#, 2
	octave 3
	note G#, 1
	rest 1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	rest 1
	octave 2
	note F#, 2
	octave 3
	note F#, 1
	rest 1
	octave 2
	note F_, 2
	octave 3
	note F_, 2
	octave 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note D#, 2
	octave 3
	note D#, 2
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 2
.loop0:
	sound_call .sub1
	sound_loop 4, .loop0
.mainloop:
	sound_call .sub2
	note G_, 2
	note A_, 2
	sound_call .sub2
	note G_, 2
	note F#, 2
	sound_call .sub3
	octave 3
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 2
	note F_, 2
	octave 3
	note D_, 2
	octave 2
	note F_, 2
	note F_, 2
	note A#, 2
	note F_, 2
	sound_call .sub2
	note G_, 2
	note A_, 2
	sound_call .sub2
	note G_, 2
	note F#, 2
	sound_call .sub3
	octave 3
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 2
	note F_, 2
	octave 3
	note A_, 2
	octave 2
	note F_, 2
	note F_, 2
	octave 3
	note G_, 2
	note C_, 2
.loop1:
	sound_call .sub4
	sound_loop 2, .loop1
	sound_call .sub4
	sound_call .sub5
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note G#, 2
	sound_call .sub5
	sound_call .sub4
	sound_call .sub5
	note G_, 2
	note C#, 2
	note C#, 2
	note G_, 2
	note C#, 2
	note C#, 2
	note G_, 2
	note G#, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note E_, 2
	octave 3
	note C#, 2
	octave 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	sound_call .sub4
	sound_call .sub5
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note G#, 2
	sound_call .sub5
	sound_call .sub4
	sound_call .sub5
	note G_, 2
	note C#, 2
	note C#, 2
	note G_, 2
	note C#, 2
	note C#, 2
	note G_, 2
	note G#, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note E_, 2
	octave 3
	note C#, 2
	octave 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A#, 2
.loop2:
	sound_call .sub6
	sound_loop 2, .loop2
	sound_call .sub7
	sound_call .sub8
.loop3:
	sound_call .sub6
	sound_loop 2, .loop3
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note E_, 2
	note A#, 2
	sound_call .sub6
.loop4:
	sound_call .sub6
	sound_loop 2, .loop4
	sound_call .sub7
	sound_call .sub8
.loop5:
	sound_call .sub6
	sound_loop 2, .loop5
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	note A_, 4
	note E_, 2
	note F_, 2
	note A_, 2
.loop6:
	sound_call .sub6
	sound_loop 7, .loop6
	note E_, 2
	note A_, 2
	note E_, 2
	note A#, 4
	note G_, 2
	note A_, 2
	note G_, 2
	sound_loop 0, .mainloop
.sub1:
	octave 2
	note A_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note A#, 2
	note G_, 2
	sound_ret
.sub2:
	octave 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	sound_ret
.sub3:
	octave 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	sound_ret
.sub4:
	octave 2
	note A_, 2
	note E_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note E_, 2
	note A_, 2
	note A#, 2
	sound_ret
.sub5:
	octave 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note A_, 2
	note A#, 2
	sound_ret
.sub6:
	octave 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	sound_ret
.sub7:
	octave 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	sound_ret
.sub8:
	octave 1
	note A#, 2
	octave 2
	note E_, 2
	octave 1
	note A#, 2
	octave 2
	note E_, 2
	octave 1
	note A#, 2
	octave 2
	note E_, 2
	octave 1
	note A#, 2
	octave 2
	note G_, 2
	sound_ret


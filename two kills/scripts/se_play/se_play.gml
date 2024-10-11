function se_play(soundeffect, pitch=1, volume=1) {
	var beep = audio_play_sound(soundeffect, 0, false);
	audio_sound_pitch(beep, pitch);
	audio_sound_gain(beep, volume, 0);
	return beep;
}
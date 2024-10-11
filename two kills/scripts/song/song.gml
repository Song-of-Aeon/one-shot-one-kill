function song(name_="among us trap remix", shortname="autr", audio_=[m_null], bpm_=100, description_="when the im.ogg", maps_=[sm_null],  loopstart=0,loopend=audio_sound_length(audio_[0])) constructor {
	name = name_;
	audio = audio_;
	bpm = bpm_;
	description = description_;
	maps = maps_;
	self.loopStart = loopstart;
	self.loopEnd = loopend;
	variable_struct_set(global.tracklist, shortname, self);
}
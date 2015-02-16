SynthDef(\Mix_Fader, { | in, out, amp, mute |
	Out.ar(out, In.ar(in, 2) * amp * mute)
});
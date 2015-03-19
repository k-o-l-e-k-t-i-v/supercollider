MyNewTest{
	var freq;
	var octave, degree;
	var sin, saw;
	var sinPlaying, sawPlaying;

	*new {|newDegree|
		^super.new.init(newDegree);
	}

	init{|newDegree|
		octave = 3;
		degree = newDegree;
		sinPlaying = false;
		sawPlaying = false;
	}

	octave{|newOctave|
		octave = newOctave;

		if(sinPlaying) { this.stopSin; this.playSin; };
		if(sawPlaying) { this.stopSaw; this.playSaw; };
	}

	degree{|newDegree|
		degree = newDegree;

		if(sinPlaying) { this.stopSin; this.playSin; };
		if(sawPlaying) { this.stopSaw; this.playSaw; };
	}

	currentFreq{
		^((octave*12)+degree).midicps;
	}

	playSin{
		sinPlaying = true;
		sin = { SinOsc.ar(this.currentFreq!2,0,0.3) }.play;
	}

	playSaw{
		sawPlaying = true;
		saw = { LFSaw.ar(this.currentFreq!2,0,0.3)}.play;
	}

	stopSin{ sin.free; sinPlaying = false; }

	stopSaw{ saw.free; sawPlaying = false;}
}

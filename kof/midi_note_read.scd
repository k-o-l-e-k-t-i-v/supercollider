

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


~l={1};
~l.fadeTime=2;

(
    //var time = LFSaw.ar(4).range(0,1);
SynthDef(\sound,{|freq=440,amp=0.2|
                 var env = EnvGen.ar(Env([0,1,0],[0.05,~l.kr],[7,-7]),doneAction:2);
                 var sig = SinOsc.ar(freq / 8 * (1.001**(1..8)) + (env**4.1*(250)),mul:amp);
                 //sig = RLPF.ar(sig,100+((cos(time)+2)*100));
                 sig = AllpassN.ar(sig,0.04,1/164,0.15);
                 sig = sig * env;
                 sig = GVerb.ar(sig,100)/4+sig;
                 sig = Limiter.ar(sig);
                 Out.ar(0,Splay.ar(sig,0.02));
}).add;
)



(
var activenotes = nil!128; //make Array of 128 slots, initially with nil objects in to represent nothing
var releasefunction = {|index|

	//release existing note if present already

	if(activenotes[index].notNil) {
		activenotes[index].release; //will send gate=0
		activenotes[index] = nil; //make sure now empty slot ready
	}
};



//create one Synth for every new note, with logic to check existing notes (though not MIDI channel sensitive)

    MIDIIn.noteOn = { arg src,chan, midinote, velocity;

	(midinote+"received").postln;
	releasefunction.value(midinote);
	//put active note in array; function above tidied any existing note on this key
	activenotes[midinote] = Synth(\sound,[\freq,midinote.midicps,\amp,velocity/127.0]);
};


//must also look for note offs as indicated end of held note

MIDIIn.noteOff = { arg src,chan, midinote, velocity;
	releasefunction.value(midinote);
};


)



// pilse synth ///////////////////////////////////////

(
~pilse.quant=1;
~pilse.fadeTime=0.02;
~pilse={
  var sig = SinOsc.ar(9000!2);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/16,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.7);
};
e.addMix(~pilse,postVol:true);
~pilse.play;
);
~pilse.stop(7);
~pilse.clear;

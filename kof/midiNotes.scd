

MIDIClient.init;


MIDIIn.connectAll;

(
MIDIFunc.noteOn({arg ...args; 
    if(args[2]==0){
      Synth.new(\noise,[\freq,args[1],\amp,args[0]]);
    };
    
    if(args[2]==1){
      Synth.new(\kick,[\freq,args[1],\amp,args[0]]);
    
    };
    args.postln;
});
)

SynthDef.help

~mod1={LFTri.kr(1/600)};

(
SynthDef(\noise,
    {|freq =100, amp=0.5|
        var sig;
        var note = freq.midicps;
        var t = SinOsc.ar(note/[1,4,8],add:1);
        var env = EnvGen.kr(Env.perc((amp/127).log), doneAction: 2);
        var mod = Perlin3.ar(t[0],t[1],t[2]) / 2;
        sig = mod;
        sig = sig * env;
        Out.ar(0, Splay.ar(sig));
    }).add; 
)
(
SynthDef(\kick,
    {|freq =100, amp=0.5|
        var sig;
        var note = freq.midicps;
        var env = EnvGen.kr(Env.perc(2), doneAction: 2);
        sig = SinOsc.ar(note,env**80*8pi,mul:amp/127);
        sig = sig * env;
        Out.ar(0, Splay.ar(sig));
    }).add; 
)

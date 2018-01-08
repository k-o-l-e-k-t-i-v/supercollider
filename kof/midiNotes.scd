

MIDIClient.init;
MIDIIn.connectAll;

(
    var lasttime=Main.elapsedTime;
    MIDIFunc.noteOn({arg ...args; 
        if(args[2]==0){
            var now = Main.elapsedTime; 
            e = now-lasttime;
            ~tempo={60.0/e/60.0};
            (60/e).postln;
            lasttime=now;
        };

    });
)



// beep synth ///////////////////////////////////////

(
~beep.ar(2);
~beep.clock = p.clock;
~beep.quant=2;
~beep.fadeTime=4;
~beep={
  var sig = SinOsc.ar(500!2) * Pulse.ar(~tempo);
  Splay.ar(sig,0.5,0.25);
};
~beep.play;
);
~beep.stop(4);
~beep.clear;
~beep.pause;
~beep.resume;



~tempo = {1};
MIDIClient.init;
MIDIIn.connectAll;

(
    var lasttime=Main.elapsedTime;
    var diff = 0;
    var ldiff;
    var e = 120;
    MIDIFunc.noteOn({arg ...args; 
        if(args[2]==0){
            var now = Main.elapsedTime; 
            e = ((now-lasttime)-e)/5.0+e;
            
            ldiff = (now-lasttime);
            diff = ldiff-diff;

            ~tempo={60.0/e/120.0};
            (60/e +" "+ diff).postln;
            
            lasttime=now;
            ldiff=diff;
        };

    });
)



// beep synth ///////////////////////////////////////

(
~beep.ar(2);
~beep.quant=4;
~beep.fadeTime=4;
~beep={
  var sig = SinOsc.ar(500/[1,2,4]) * Pulse.ar(~tempo*2/[1,2,4]);
  Splay.ar(sig,0.5,0.15);
};
~beep.play;
);
~beep.stop(4);
~beep.clear;
~beep.pause;
~beep.resume;



// test
s.reboot;


//  4) composerTrack_A - own scheduling of single track //////////////////////////////////


(
    ~offset = -5;
    Ndef(\lalala).fadeTime = 0.02;
    Ndef(\lalala).quant = 1;
    Ndef(\lalala,{
        Splay.ar(
            SinOsc.ar(4320 / (2pi**(1..8)) * (1.0001**(1..8)),mul:1/(1..8)) * LFSaw.ar(4/[1,2,4,8]).squared
            ,0.5,0.85,0.5)
    });

    Tdef(\Track_C, {
        ~tc.sched(5+~offset, {
            "kof play...".postln;
            Ndef(\lalala).play;
        });
        ~tc.sched(10+~offset, {
            "kof fadeout...".postln;
            Ndef(\lalala).stop(1);
        });
    
        ~tc.sched(10+~offset, {
            "kof play...".postln;
            Ndef(\lalala).play;
        });
        ~tc.sched(15+~offset, {
            "kof fadeout...".postln;
            Ndef(\lalala).stop(1);
          Ndef(\lalala).clean;
        });
    });


    ~composition.value(True,True,True).play;
)
//  4) composerTrack_C - end of file /////////////////////////////////////////////////////




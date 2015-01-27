
// test
s.boot;


//  4) composerTrack_A - own scheduling of single track //////////////////////////////////


(
    Ndef(\lalala).fadeTime = 0.02;
    Ndef(\lalala).quant = 1;
    Ndef(\lalala,{Splay.ar(SinOsc.ar(43.2*(1..8),mul:1/(1..8)),0.5,1,0.5)});

    Tdef(\Track_C, {
        ~tc.sched(5, {
            "composerTrack_C - sec15 - play".postln;
            Ndef(\lalala).play;
        });
        ~tc.sched(10, {
            "composerTrack_C - sec25 - stop".postln;
            Ndef(\lalala).stop(4);
        });
    });


    ~composition.value(True,True,True).play;
)
//  4) composerTrack_C - end of file /////////////////////////////////////////////////////




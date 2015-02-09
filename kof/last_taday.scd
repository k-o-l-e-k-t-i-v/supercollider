

(
    Ndef(\a).quant = 2.0;
    Ndef(\a,{
        Splay.ar(
            CombC.ar(
                CombC.ar(
                    LFSaw.ar([51,51.01]) 
                    ,0.02,0.02001,32)
                ,2,2,32)
            ,0.5,0.1,0.5)}).play;
)

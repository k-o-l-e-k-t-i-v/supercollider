(
    Ndef(\a,{




        ~slope = 1.0025;
        ~speed = 1/4;
        ~cnt = 12;
        ~am = 22000;

        ~sh = (1..(~cnt)).normalize*~am;
        ~f = SinOsc.ar(~speed*(~slope**(1..(~cnt)))).range(~sh,~am/~cnt+~sh);
        
        
        ~s = SinOsc.ar(~f,mul:0.2) * SinOsc.ar(1/32/(1..~cnt)).range(0,1);

        //~s = Mix.ar(~s);

        Splay.ar(
            Resonz.ar(
            FreeVerb.ar(~s,0.02,0.02)
            ,~f)
        )}).play;
)

s.scope;

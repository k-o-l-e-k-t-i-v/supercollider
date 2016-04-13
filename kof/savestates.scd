
// MultiLevelIdentityDictionary

// init or erase
(
    a=List.new;
    i = 0;
)


// redefine and save source few times
(
    ~test = {LFSaw.ar(4320*1.rrand(8).reciprocal,mul:0.2) * Pulse.ar(fib(4,1,1.rrand(4)))};
    ~test.play;
    a.add(~test.source.asCompileString);
)
~test.fadeTime=3;


// loop through states
(
    r= fork{
        loop{

            ~test = a[i].interpret;
            i=i+1;
            i=i%a.size;
            1.wait;
        };
    };
)   

a=a.scramble;
r.stop


~z.fadeTime=4;
~z={GVerb.ar(LPF.ar(PitchShift.ar(\in.ar,0.02,0.25),8000),150,30,spread:95)};
~test<>>~z;
~z.play;

Dictionary
List
d=()
d.add(p[\test],p[\test].source.asCompileString;);

d[\test].interpret;

d

~test<>>p[\out];

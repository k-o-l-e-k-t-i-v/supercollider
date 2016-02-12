

~voice.

~voice.play;

~voice[0]={Mix.ar(AudioIn.ar([0,1]))!2};

~voice[47]=\filter->{|in| PitchShift.ar(in,0.1,0.75)*4};//CombN.ar(in,LFTri.ar(4/(1..8)).range(0.1,1),4,8)};
~voice[50]=\filter->{|in| BBandPass.ar(in,LFTri.ar(4).range(50,8800)) * 2};
~voice[53]=\filter->{|in| 2*Resonz.ar(in,LFTri.ar(1/4/(1..8)).range(50,550))};
~voice[57]=\filter->{|in| FreeVerb.ar(in,LFTri.ar(1/4/(1..8)).range(0.1,0.8),2)};


(
~voice[47]=nil;//\filter->{|in| CombN.ar(in,LFTri.ar(4/(1..8)).range(0.1,1),4,8)};
~voice[50]=nil;//\filter->{|in| BBandPass.ar(in,LFTri.ar(4).range(50,8800)) * 2};
~voice[53]=nil;//\filter->{|in| 2*Resonz.ar(in,LFTri.ar(1/4/(1..8)).range(50,550))};
~voice[57]=nil;//\filter->{|in| FreeVerb.ar(in,LFTri.ar(1/4/(1..8)).range(0.1,0.8),2)};
)

s.boot;
s.scope
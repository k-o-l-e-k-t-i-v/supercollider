

~voice.

~voice.play;

~voice[0]={Mix.ar(AudioIn.ar([0,1]))!2};

~voice[47]=\filter->{|in| CombN.ar(in,LFTri.ar(1/16/(1..8)).range(0.1,8),8,8)};
~voice[50]=\filter->{|in| BBandPass.ar(in,LFTri.ar(1/16/(1..8)).range(50,8800))};
~voice[53]=\filter->{|in| 2*Resonz.ar(in,LFTri.ar(1/4/(1..8)).range(50,5500))};
~voice[57]=\filter->{|in| FreeVerb.ar(in,LFTri.ar(1/4/(1..8)).range(0.1,0.8),2)};


// History, as it was on Sat Jun 20 19:06:07 2015.

[
[ 0, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source));
  sound = SinOsc.ar(400) * Decay.ar(K2A.ar(tempo),0.05);

  Splay.ar(sound.flat,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1.710543175, 'me', "thisProcess.stop;" ],
[ 9.979602549, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source));
  sound = SinOsc.ar(400,mul:0.1) * Decay.ar(K2A.ar(tempo),0.05);

  Splay.ar(sound.flat,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 11.342330998, 'me', "thisProcess.stop;" ],
[ 32.445223279, 'me', "thisProcess.stop;" ],
[ 40.410136976, 'me', "(
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source));
  sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(sound.flat,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 44.151010589, 'me', "thisProcess.stop;" ],
[ 85.661190743, 'me', "b = Buffer.alloc(s,1024,1);" ],
[ 87.822955797, 'me', "(
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source));
  sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(sound.flat,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 91.17200059, 'me', "thisProcess.stop;" ],
[ 101.008709001, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source));
  sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(sound.flat,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 105.861890894, 'me', "thisProcess.stop;" ],
[ 138.135788414, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source)).poll;
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 162.747653531, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source)).poll;
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 173.771007193, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source));
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 175.793194611, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]);
  tempo = BeatTrack.kr(FFT(b, source)).poll;
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 184.411310503, 'me', "thisProcess.stop;" ],
[ 301.118563102, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]).poll;
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 486.245622791, 'me', "thisProcess.stop;" ],
[ 489.444780622, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= SoundIn.ar([1,1]).poll;
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 491.03984035, 'me', "thisProcess.stop;" ],
[ 812.10211909, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([1,1]),0.02,4);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 825.393505484, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([1,1]),0.025,4);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 827.301163297, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([1,1]),0.025,2);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 832.103795223, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([0,0]),0.025,2);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 837.869743209, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([0,0]),0.025,4);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 839.862106551, 'me', "thisProcess.stop;" ],
[ 840.987891855, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([0,0]),0.025,2);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 843.275317062, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([0,0]),0.25,2);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 852.295109614, 'me', "(
b = Buffer.alloc(s,1024,1);
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([0,0]),0.25,1);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 866.875849364, 'me', "(
~test.quant=2;
~test.fadeTime=0.1;
~test={
  var tempo;
  var source;
  var sound;

  source= PitchShift.ar(SoundIn.ar([0,0]),0.25,1);
  //sound = SinOsc.ar(400,mul:0.01) * Decay.ar(K2A.ar(tempo),0.5);

  Splay.ar(source,0,0.75);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],

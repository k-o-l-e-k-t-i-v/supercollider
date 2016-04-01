// History, as it was on Sun Jun  7 12:10:26 2015.

[
[ 0, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*fib(21));
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 8.359891084, 'me', "thisProcess.stop;" ],
[ 11.995409848, 'me', "thisProcess.stop;" ],
[ 12.755342475, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*fib(21));
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 17.960117086, 'me', "thisProcess.stop;" ],
[ 19.189204123, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*fib(21));
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 30.266702668, 'me', "thisProcess.stop;" ],
[ 44.059874514, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*fib(21),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 49.233092181, 'me', "thisProcess.stop;" ],
[ 50.833148721, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*fib(21),mul:0.2);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.0015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 56.17143357, 'me', "thisProcess.stop;" ],
[ 56.517134929, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*fib(21),mul:0.02);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.0015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 65.310794091, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*fib(21),mul:0.01);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.0015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 75.284737361, 'me', "thisProcess.stop;" ],
[ 80.203340302, 'me', "thisProcess.stop;" ],
[ 80.513074486, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(5*fib(21)),mul:0.01);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.0015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 85.696950467, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(21)),mul:0.01);
  Splay.ar(sig.flat,0.25,0.0015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 87.276485799, 'me', "thisProcess.stop;" ],
[ 87.853678762, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(21)),mul:0.01);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.0015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 93.997813682, 'me', "thisProcess.stop;" ],
[ 94.562331964, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)),mul:0.01);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.0015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 97.18946921, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)),mul:0.1);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.0015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 101.788111304, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)),mul:0.1);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 109.73729152, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 111.676023329, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 112.350947087, 'me', "thisProcess.stop;" ],
[ 113.011269979, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 128.676575027, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)*pi),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 136.688390686, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)*2pi),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 150.894557703, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50+(fib(12)*4pi),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 156.112192415, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(50+(fib(12)*4pi),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 195.459742246, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75+(fib(12)*4pi),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 202.403592522, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(100+(fib(12)*4pi),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 205.084990314, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(100+(fib(12)*8pi),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(12)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 226.145258631, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(100+(_*pi!8),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 230.636967011, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(100+(_*pi!8),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 317.935366359, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(200+(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 335.02382131, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60.midicps/4+(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 346.511024331, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60.midicps/4+(_*1.25pi!8),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 351.150499773, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60.midicps/4+(_*8pi!8),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 360.678500171, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(60.midicps/(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 367.026064933, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(72.midicps/(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 374.937659502, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+12).midicps/(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 427.507674219, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+12).midicps/(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 435.999507951, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+24).midicps/(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 446.392626543, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 449.244178534, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*1.5pi!8),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 925.281388648, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*1.5pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 948.243756751, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 955.366870884, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*2pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 961.617182278, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 966.680758759, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 979.69134797, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1012.889278757, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/4pi,mul:0.1 );
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1030.972977077, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/8pi,mul:0.1);
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1035.274874867, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/8pi/1.5,mul:0.1);
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1039.21331914, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/8pi/1.25,mul:0.1);
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1049.835203852, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/8pi/[1.25,1.5],mul:0.1);
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1071.348940872, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/[8pi,2pi]/[1.25,1.5],mul:0.1);
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1106.612887662, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/[8pi,2pi]/[1.25,1.5],mul:0.1);
  sig = LFSaw.ar(1/6) + sig;
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1115.018090865, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/[8pi,2pi]/[1.25,1.5],mul:0.1);
  sig = LFSaw.ar(1) + sig;
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1117.215175919, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/[8pi,2pi]/[1.25,1.5],mul:0.1);
  sig = LFSaw.ar(4) + sig;
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1131.594649984, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/[8pi,2pi]/[1.25,1.5],mul:0.1);
  sig = LFSaw.ar(4).exprand(0.001,1) + sig;
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1133.946512637, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/[8pi,2pi]/[1.25,1.5],mul:0.1);
  sig = LFSaw.ar(4).exprand(0.001,1) * sig;
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1142.734567514, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/[8pi,2pi]/[1.25,1.5],mul:0.1);
  sig = LFSaw.ar(4).exprange(0.001,1) * sig;
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1144.85885517, 'me', "thisProcess.stop;" ],
[ 1145.187644497, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/[8pi,2pi]/[1.25,1.5],mul:0.1);
  sig = LFSaw.ar(4).exprange(0.001,1) * sig;
  sig = sig * LFSaw.ar(1/8/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 1153.238033781, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar((72+36).midicps/(_*4pi!8) + SinOsc.ar(11/fib(8)).range(-4,4),mul:0.4);
  sig = sig + LFSaw.ar((72+36).midicps/
// History, as it was on Sat Jun 20 18:22:40 2015.

[
[ 0, 'me', "thisProcess.stop;" ],
[ 10.984162586, 'me', "(
~input.quant=2;
~input.fadeTime=5;
~input={
  var sig = AudioIn.ar([0,0]);
  sig = SinOsc.ar(440) * sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 14.733868154, 'me', "(
~input.quant=2;
~input.fadeTime=5;
~input={
  var sig = AudioIn.ar([0,0]);
  sig = SinOsc.ar(440) * sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 20.965787878, 'me', "(
~input.quant=2;
~input.fadeTime=5;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(440) * sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 31.955954585, 'me', "(
~input.quant=2;
~input.fadeTime=5;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(70) * sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 36.623161203, 'me', "(
~input.quant=2;
~input.fadeTime=5;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(80) * sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 60.496774841, 'me', "(
~input.quant=2;
~input.fadeTime=5;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(80) * LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 73.337658472, 'me', "(
~input.quant=2;
~input.fadeTime=5;
~input={
  var sig = AudioIn.ar([0,0]);
  sig = SinOsc.ar(80) * LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 89.884412678, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(80) * LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 105.306848592, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(800) * LeakDC.ar(sig).exprange(0.0001,0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 114.520665103, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(400) * LeakDC.ar(sig).exprange(0.0001,0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 122.158344718, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 132.425431027, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(200.00,4000.0));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 136.142587065, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(200.00,4000.0),mul:0.1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 139.274948357, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(200.00,4000.0),mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 146.966132989, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(20.00,4000.0),mul:0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 154.874055786, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(20.00,400.0),mul:0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 165.337127178, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(200.00,400.0),mul:0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 205.417978031, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(200.00,14000.0),mul:0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 209.987580655, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(200.00,1400.0),mul:0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 220.430188315, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(200.00,1400.0),mul:0.4);
  sig = BPF.ar(sig,400);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 228.752256925, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = SinOsc.ar(sig.exprange(200.00,140.0),mul:0.4);
  sig = BPF.ar(sig,400);
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 234.61408559, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(200.00,140.0),mul:0.4);
  sig = BPF.ar(sig,400);
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 262.046458641, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(200.00,140.0),mul:0.4);
  sig = BPF.ar(sig,400);
  sig = GVerb.ar(sig,10)/4+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 269.064323591, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(20.00,140.0),mul:0.4);
  sig = BPF.ar(sig,400);
  sig = GVerb.ar(sig,100)/4+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 276.754730434, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(20.00,1400.0),mul:0.4);
  sig = BPF.ar(sig,400);
  sig = GVerb.ar(sig,100)/4+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 279.999474126, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(20.00,140.0),mul:0.4);
  sig = BPF.ar(sig,400);
  sig = GVerb.ar(sig,100)/4+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 282.408828906, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(20.00,140.0),mul:0.4);
  sig = BPF.ar(sig,200);
  sig = GVerb.ar(sig,100)/4+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 284.275493486, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(20.00,140.0),mul:0.4);
  sig = BPF.ar(sig,200);
  sig = GVerb.ar(sig,10)/4+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 288.730260265, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(20.00,140.0),mul:0.4);
  sig = BPF.ar(sig,200);
  sig = GVerb.ar(sig,3)/4+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 290.672977435, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(20.00,140.0),mul:0.4);
  sig = BPF.ar(sig,200);
  sig = GVerb.ar(sig,3)/2+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 293.539271725, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(60.00,140.0),mul:0.4);
  sig = BPF.ar(sig,200);
  sig = GVerb.ar(sig,3)/2+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 295.863152099, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(60.00,440.0),mul:0.4);
  sig = BPF.ar(sig,200);
  sig = GVerb.ar(sig,3)/2+sig;
  
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 301.23025215, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LFSaw.ar(sig.exprange(60.00,440.0),mul:0.4);
  sig = BPF.ar(sig,200);
  sig = GVerb.ar(sig,3)/2+sig;
  
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 301.743237933, 'me', "thisProcess.stop;" ],
[ 318.9917412, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 335.455999962, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,4); 
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 341.874030153, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,4); 
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 344.423530599, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,8); 
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 348.382357317, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,0.2,8); 
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 355.315098353, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,0.2,16); 
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 370.061790478, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,0.2,16);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 379.432533746, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,0.2,[8,16,4,2]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 384.694162001, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,0.2,[8,16,4,2,1.5]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 403.440772275, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(-1.01,1.0),0.2,[8,16,4,2,1.5]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 412.343825916, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(-0.51,0.50),0.2,[8,16,4,2,1.5]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 424.738593796, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50),0.2,[8,16,4,2,1.5]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 427.752811084, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[8,16,4,2,1.5]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 436.514020385, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[2,8,16,4,2,1.5]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 439.055562131, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[2,8,16,4,2,1.5]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 444.28643354, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[2,8,16,4,2,1.5]);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 446.824142852, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[2,8,16,4,2,1.5]);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 450.471607534, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[2,8,16,4,2,1.5]);
  sig = GVerb.ar(sig,4)/2+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 455.411399184, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[2,8,16,4,2,1.5]);
  sig = GVerb.ar(sig,4)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 492.103885544, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[2,8,16,4,2,1.5]);
  sig = GVerb.ar(sig,4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 512.634094259, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig.exprange(0.001,0.50)-0.25,0.2,[8]);
  sig = GVerb.ar(sig,4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 521.068287028, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(sig,0.2,[8]);
  sig = GVerb.ar(sig,4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 529.039722156, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(LeakDC.ar(sig),0.2,[8]);
  sig = GVerb.ar(sig,4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 540.728027733, 'me', "~input.scope;" ],
[ 589.028217253, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(LeakDC.ar(sig),0.2,[8]);
  //sig = GVerb.ar(sig,4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 590.613691697, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = PitchShift.ar(LeakDC.ar(sig),0.2,[8]);
  //sig = GVerb.ar(sig,4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 609.038907199, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = PitchShift.ar(LeakDC.ar(sig),0.2,[8]);
  //sig = GVerb.ar(sig,4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 624.029782525, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = PitchShift.ar(LeakDC.ar(sig),0.2,[8]);
  sig = GVerb.ar(HPF.ar(sig,400),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 629.189250617, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = PitchShift.ar(LeakDC.ar(sig),0.2,[8]);
  sig = GVerb.ar(HPF.ar(sig,40),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 633.059041404, 'me', "thisProcess.stop;" ],
[ 659.447967709, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = PitchShift.ar(LeakDC.ar(sig),0.2,[8]);
  sig = GVerb.ar(LeakDC.ar(sig,0.2),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.95);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 662.657374861, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = PitchShift.ar(LeakDC.ar(sig),0.2,[8]);
  sig = GVerb.ar(LeakDC.ar(sig,0.2),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 677.22039185, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(LeakDC.ar(sig),0.2,1.5);
  sig = GVerb.ar(LeakDC.ar(sig,0.2),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 685.988927841, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(LeakDC.ar(sig),0.2,1.25);
  sig = GVerb.ar(LeakDC.ar(sig,0.2),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 690.045367774, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(LeakDC.ar(sig),0.2,1.25);
  sig = GVerb.ar(LeakDC.ar(sig,0.5),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 693.377673042, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = PitchShift.ar(LeakDC.ar(sig),0.2,1.125);
  sig = GVerb.ar(LeakDC.ar(sig,0.5),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 702.253189752, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = GVerb.ar(LeakDC.ar(sig,0.5),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 706.382320516, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = GVerb.ar(LeakDC.ar(sig,0.5),4,0.1)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 711.184552158, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = GVerb.ar(LeakDC.ar(sig,0.5),4)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 714.011118982, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = GVerb.ar(LeakDC.ar(sig,0.5),4)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
);" ],
[ 732.842535281, 'me', "thisProcess.stop;" ],
[ 1470.880161052, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,100);
  sig = Changed.ar(sig,0.02);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1621.868190052, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,100);
  sig = Changed.ar(sig,0.04);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1623.579208782, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,100);
  sig = Changed.ar(sig,0.004);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1633.152110861, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,100);
  sig = Changed.ar(sig,0.005);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1636.473688965, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,100);
  sig = Changed.ar(sig,0.0002);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1639.033550925, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,100);
  sig = Changed.ar(sig,0.5);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1644.472322155, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,100);
  sig = Changed.ar(sig,0.005);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1652.604869318, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.005);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1655.271638266, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig);
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.005);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1660.694160174, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.2);
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.005);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1664.793685181, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.2);
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.05);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1668.902726293, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.2);
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.05);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1672.242688385, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.02);
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.05);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1675.026877146, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.05);
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.05);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1676.220463204, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.08);
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.05);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1678.713142386, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.08).poll;
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.05);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1691.123439483, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.08)*1000;
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.05);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1695.843612826, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.08)*1000;
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.5);
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1700.02078969, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.08)*1000;
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1706.499649621, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  sig = LeakDC.ar(sig,0.08)*1000;
  //sig = LPF.ar(sig,400);
  sig = Changed.ar(sig,0.25).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1751.54885194, 'me', "thisProcess.stop;" ],
[ 1766.167774376, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig);
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1777.931479814, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig);
  sig = Changed.ar(sig,0.25).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1780.461731512, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig);
  sig = Changed.ar(sig,0.75).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1783.369276172, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig);
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1784.800569898, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig);
  sig = Changed.ar(sig,0.35).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1796.266107507, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig);
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1801.82882733, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*10;
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1804.180122677, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*100;
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1808.691588223, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*50;
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1813.405594846, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*25;
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1820.432508006, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*30;
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1827.672453047, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*35;
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1841.063377869, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*40;
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1844.256309362, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*32;
  sig = Changed.ar(sig,0.5).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1846.836132024, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*32;
  sig = Changed.ar(sig,0.45).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1849.360464978, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*32;
  sig = Changed.ar(sig,0.75).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(440,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1858.445597288, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*32;
  sig = Changed.ar(sig,0.75).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(72,mul:0.2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1860.551609772, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*32;
  sig = Changed.ar(sig,0.75).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = sig * SinOsc.ar(72,mul:0.5);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~input,postVol:true);
~input.play;
);" ],
[ 1868.031658809, 'me', "(
~input.quant=2;
~input.fadeTime=2;
~input={
  var sig = AudioIn.ar([1,1]);
  //sig = LPF.ar(sig,400);
  sig = Mix(sig)*32;
  sig = Changed.ar(sig,0.75).poll;
  sig = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),sig);
  sig = 
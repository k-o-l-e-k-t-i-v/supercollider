

(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);


// circular synth ///////////////////////////////////////

(
~circular.ar(2);
~circular.quant=2;
~circular.fadeTime=0.004;
~circular={
  var xx;
  var yy;
  var filfreq2 = Duty.ar((1..32)*16,0,Dseq(([60,65,67,64] +.x [0,0,0,-12,-24,12,24,36,48]).midicps,inf)) + SinOsc.kr(1/8/(1..32),mul:10).lag(4);
  var filfreq = Duty.ar((1..32)*4,0,Dseq(([60,65,67,64] +.x [0,0,0,-12,-24,12,24,36,48]).midicps,inf)) + SinOsc.kr(filfreq2/(1..32),mul:100).lag(4);
  var ff = filfreq+((1..32)/100);
  var loop = filfreq+((1..32)/100);
  var t = LFSaw.ar(loop).range(0,2pi) + LFTri.ar(1/400/(1..32),mul:44100);
  var st = LFTri.ar(loop/10).range(0,2pi) + LFTri.ar(1/40,mul:8pi);
  var x = t.cos;
  var y = t.sin;
  var sx = st.cos;
  var sy = st.sin;

  
  var sig = Perlin3.ar(x,y,t*ff);
  var bck = Perlin3.kr(sx,sy,st);
  sig = BBandPass.ar(sig,filfreq2,LFTri.ar(1/16/(1..32)).exprange(0.0005,1)**4/2);
  sig = Resonz.ar(sig,filfreq*4,0.62);
  sig = Normalizer.ar(sig) * (LFTri.kr(1/4/(1..32))**4) * (LFTri.kr(1/16/(1..32))**4);
  sig = LeakDC.ar(sig);
  sig = AllpassN.ar(PitchShift.ar(sig,2/filfreq,1/[1,1.5,2,1.3333]),1,1,[1,2,3,4]);
  sig = sig/4+LPF.ar(sig,3000);
  sig = CompanderD.ar(sig,1/2,1,1/4);
  #xx,yy = Pan4.ar(NumChannels.ar(sig,4),sx,sy)+sig;
  sig = []++xx++yy;
  Splay.ar(sig,0.75,0.25);
};
~circular.play;
~circular[1] = \filter -> {|sig| DWGReverb.ar(HPF.ar(LPF.ar(sig,5000),50),[5000,5050],1/2)+sig};
~circular[2] = \filter -> {|sig| Resonz.ar(sig,LFTri.ar(1/16/(1..32)).exprange(130,14000),0.82)*4+sig;};
);
~circular.stop(4);
~circular.clear;
~circular.pause;
~circular.resume;

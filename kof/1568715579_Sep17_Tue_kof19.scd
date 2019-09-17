


p.push
p.bpm(138.88)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=1;
~one={
    var aa = LFTri.ar(~tempo/16/[1,2,3,4]).range(50,5000);
    var bb = LFTri.ar(~tempo/24/[1,2,3,4]).range(0.1,100);

    var sel = Duty.kr([[4,8,16],[8,16,32],[16,32,64],32]/~tempo,0,Dseq([60,65,48,64,72,67,36,69,60,61],inf)) +.x [0,-12,0,24];
    var f = [sel[0],sel[1],sel[2],36].midicps + SinOsc.kr([4,5,6,7] , mul:3);
  var sig = LFSaw.ar([f,f+0.0001]);// * Pulse.ar(~tempo*2/[1,2,3,4]);
  sig = Perlin3.ar(SinOsc.ar(f)+1/4,LPF.ar(sig,aa)/bb,sig/1600+LFSaw.ar(~tempo/16/[1,2,3,4])*[f/4,f/4+0.001]);
  sig = LeakDC.ar(sig);
  sig = MoogFF.ar(sig,f*[1,2,4,8],LFTri.kr(~tempo/4/(1..4)).range(0.1,3.4)) + sig;
  sig = sig * (LFTri.ar(~tempo/4/[1,2,3,4]));
  Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=1;
~two={
    var aa = LFTri.ar(~tempo/16/[1,2,3,4]).range(50,5000);
    var bb = LFTri.ar(~tempo/24/[1,2,3,4]).range(0.1,100);

    var sel = Duty.kr([[4,8,16],[8,16,32],[16,32,64],32]/~tempo,0,Dseq([60,65,48,64,72,67,36,69,60,61],inf)) +.x [0,-12,0,24];
    var f = [sel[0],sel[1],sel[2],36].midicps + SinOsc.kr([4,5,6,7] , mul:3);
  var sig = LFSaw.ar([f,f+0.0001]);// * Pulse.ar(~tempo*2/[1,2,3,4]);
  sig = Perlin3.ar(SinOsc.ar(f)+1/4,LPF.ar(sig,aa)/bb,sig/1600+LFSaw.ar(~tempo/16/[1,2,3,4])*[f/4,f/4+0.001]);
  sig = LeakDC.ar(sig);
  sig = MoogFF.ar(sig,f*[1,2,4,8],LFTri.kr(~tempo/4/(1..4)).range(0.1,3.4)) + sig;
  sig = sig * (LFTri.ar(~tempo/4/[1,2,3,4]));
  Splay.ar(sig,0.95,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~one.pause;
~one.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

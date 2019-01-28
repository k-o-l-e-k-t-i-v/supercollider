

p.push();


(
b.free;
b=Buffer.alloc(s,2**16,2);
)

2**16/48000

// recc synth ///////////////////////////////////////

(
~recc.ar(2);
~recc.clock = p.clock;
~recc.quant=0;
//~recc.fadeTime=4;
~recc={
  RecordBuf.ar(LeakDC.ar(SoundIn.ar([0,1]) + ~outt.ar),b.bufnum,0,0.3,loop:1);
 // Splay.ar(sig,0.5,0.25);
};
//~recc.play;
);
~recc.stop(4);
~recc.clear;
~recc.pause;
~recc.resume;

Tdef(\reb,{loop{ ~recc.rebuild ; 5.wait; }}).play;

p.bpm(120);


// outt synth ///////////////////////////////////////

(
~outt.ar(2);
~outt.clock = p.clock;
~outt.quant=2;
~outt.fadeTime=4;
~outt={
    var mod = Duty.kr([15,60,30,120,90,33,37,40,20]/~tempo,0,Dseq([1,2,1.5,4]++(2..7).log2,inf));
    var r = 4;//[2,1,1.5]*4;
  var sig = Osc.ar(b.bufnum,/*r/1.3653334*[1,-1,1.5,1/2,-1/2]*.x[1,1/2,-1,1.5]*/48000/(2**16)/mod,mul:[1,0.4,0.2,0.1]);
  //sig = PitchShift.ar(sig,0.1,mod/r);
  //sig = (sig * (LFTri.ar(~tempo/15/[1,2,3,4])**2));
  //sig = AllpassN.ar(sig,1/~tempo,1/~tempo,1);
  //sig = Normalizer.ar(sig)/4;
  sig = LPF.ar(sig,15000);
  sig = CompanderD.ar(sig,3/4,1/(LFTri.ar(~tempo/15/[1,2,3,4])**2).range(1,3),2);
  Splay.ar(sig,0.5,0.75);
};
~outt.play;
);
~outt.stop(4);
~outt.clear;
~outt.pause;
~outt.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
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

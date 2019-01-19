

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
  RecordBuf.ar(SoundIn.ar([0,1]),b.bufnum,0,0.9,loop:0);
 // Splay.ar(sig,0.5,0.25);
};
//~recc.play;
);
~recc.stop(4);
~recc.clear;
~recc.pause;
~recc.resume;

Tdef(\reb,{loop{ ~recc.rebuild ; 15.wait; }}).play;

p.bpm(125);


// outt synth ///////////////////////////////////////

(
~outt.ar(2);
~outt.clock = p.clock;
~outt.quant=2;
~outt.fadeTime=4;
~outt={
    var r = [2,4,8];
  var sig = Osc.ar(b.bufnum,r/1.3653334*[1,-1,1.5,1/2,-1/2]*.x[1,1/2,-1,1.5],mul:[1,0.4,0.2,0.1]);
  sig = PitchShift.ar(sig,1.0,1/r);
  sig = (sig * (LFTri.ar(~tempo/[1,2,3,4])**2));
  sig = CombN.ar(sig,4/~tempo,4/~tempo,4);
  sig = CompanderD.ar(sig,3/4,1/2,1);
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
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
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

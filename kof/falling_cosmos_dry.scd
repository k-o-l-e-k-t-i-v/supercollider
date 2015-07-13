


(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// synbthe synth ///////////////////////////////////////

(
~synbthe.quant=2;
~synbthe.fadeTime=0.05;
~synbthe={
  var speed = Duty.kr([1,2],0,Dseq([1,2,4,8],inf));
  var sig = Decay.ar(Impulse.ar(speed*[1,2,1/8,1/16]),0.1);
  sig = RLPF.ar(sig,[10,15,30,40,80,1200]);
  
  Splay.ar(sig.flat.clip,0.25,0.25);
};
e.addMix(~synbthe,postVol:true);
~synbthe.play;
);
~synbthe.stop(7);
~synbthe.clear;


// lll filter ///////////////////////////////////////

(
~lll.quant=2;
~lll.fadeTime=0.05;
~lll={
  var high,mid,low;
  var sig = e.ar;
  sig = BBandPass.ar(sig,12000/(1..32),0.1)*LFTri.ar(8/(1..32)).exprange(0.001,1);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,SinOsc.kr(2.1/(1..32)).exprange(1.001,1/8),1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,SinOsc.kr(1.11/(1..32)).exprange(1.001,1/8),1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,SinOsc.kr(0.111/(1..32)).exprange(1.001,1/8),1/2);
  sig = CompanderD.ar((high+mid+low).flat.clip,4/3,1/2,1/2);
  Splay.ar(sig,0.25,0.25);
};
~lll.play;
);
~lll.stop(7);

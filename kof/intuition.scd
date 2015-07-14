


(
  p=ProxySpace.push(s.reboot);
);


// feedback synth ///////////////////////////////////////

(
  ~feedback.quant=1;
  ~feedback.fadeTime=0.002;
  ~feedback={
    var x,y,low,mid,high;
    var mod = Duty.kr(4,0,Dseq([8,16,1.5*8,16,4,32,8*1.5,8],inf)).lag(1/8);
    var sig = SinOsc.ar(55.2!2,mul:0.5);
    sig = CombN.ar(sig,0.5,LFSaw.ar(50*LFSaw.ar(1/4).exprange(0.00001,1)*(1.001**(1..8))).exprange(0.0001,1),4);
    
    x = Normalizer.ar(sig)/2;
    y = Saw.ar(43.2*mod/[1,1.5,1.25,1.125],mul:LFTri.ar(1/4/fib(4)).exprange(0.001,1));
    #x,y = Rotate2.ar(x,y,SinOsc.ar(1/8/fib(8)).range(-0.25,0.25));
    
    sig = FreeVerb2.ar(x,y,0.33);
    sig = RLPF.ar(sig,9000*LFSaw.ar(1/4/fib(8)).exprange(0.0001,1)+40);
    sig = Limiter.ar(sig,0.95);
    sig = GVerb.ar(sig,100,2,0.01,0.95,65);
    low = CompanderD.ar(LPF.ar(sig,200),4/3,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,400,2),4/3,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,8200),4/3,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat.clip(-1,1),4/3,1/1.1,1/1.1);

    Splay.ar(sig,0.75,0.25);
  };
  ~feedback.play;
);
~feedback.stop(7);
~feedback.clear;


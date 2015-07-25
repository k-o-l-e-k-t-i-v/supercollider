

// tick synth ///////////////////////////////////////

(
~tick.quant=1;
~tick.fadeTime=4.02;
~tick={
    var env = EnvGen.ar(Env([0,1,0],[0.002,4.5],[3,-3]),Impulse.ar(1/4,(0..3)/4));
    var sig = Mix.fill(8,{|i|SinOsc.ar([750,500*1.5,250*1.25,750/1.5]/4+SinOsc.kr(i)+(i/10.1))*0.1});
    sig = sig * env ;
  Mix.ar(sig) * 0.25;
};
e.addMix(~tick,postVol:true);
~tick.play;
);
~tick.stop(7);
~tick.clear;





// wre filter ///////////////////////////////////////

(
~wre.quant=1;
~wre.fadeTime=4;
~wre={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,40)/16 + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Splay.ar(sig,0.05,0.125);
};
~wre.play;
);
~wre.stop(30);
~wre.clear;




// saw synth ///////////////////////////////////////

(
~saw.quant=1;
~saw.fadeTime=4.02;
~saw={
    var sig = [] ++ Mix.ar(LFSaw.ar(100+((1..16)/100)+SinOsc.ar(1/fib(8)))) ++ SinOsc.ar(432);
    sig = sig * LFSaw.ar(1/4/fib(16)).exprange(0.001,1);
    sig = LPF.ar(sig,1000+LFSaw.ar(1/8/fib(8)).exprange(0.001,10000));
    sig = GVerb.ar(sig,100)/32+sig;
    Mix.ar(sig) * 0.0015;
};
e.addMix(~saw,postVol:true);
~saw.play;
);
~saw.stop(7);
~saw.clear;



// quaa filter ///////////////////////////////////////

(
~quaa.quant=1;
~quaa.fadeTime=1;
~quaa={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,40)/16 + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Splay.ar(sig,0.05,0.25);
};
~quaa.play;
);
~quaa.stop(7);
~quaa.clear;

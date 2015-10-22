



(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


(
~mod1.kr(2);
~mod2.kr(2);
~mod3.kr(2);

~mod1.fadeTime=1/4;
~mod2.fadeTime=1/2;
~mod3.fadeTime=1/4;

~mod1 = {(1+[1,2].reciprocal*[4,8])};
~mod2 = {[2,8]};
~mod3 = {[4,2]};
)

(
  ~mel.fadeTime=4;
  ~mel.quant=2;
  ~mel={ 
    var freq = SinOsc.kr(40/(1..16).scramble,mul:40*LFNoise2.kr(4/(1..16)))+4320/~mod1*[2,4]*[2,8]/((~mod2*pi)*Duty.kr(1/4*(1+((1..16)/16)),0,Dseq([1,2,1.5,1.25,0,2,0.5,0.25],inf)));
    var sig  = SinOsc.ar(freq,mul:LFTri.kr(~mod3/(1..16)).exprange(0.0001,0.2)); 
    Splay.ar(sig,0.5,0.75);
  };
  ~mel.play;
);



~mel.rebuild;

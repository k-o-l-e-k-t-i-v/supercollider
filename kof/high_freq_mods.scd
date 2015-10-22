



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


~vol.kr(1);
~vol.fadeTime=32;
~vol = {0.5};

~width.kr(1);
~width.fadeTime=2;
~width={SinOsc.kr(1/17).range(0.01,0.9)};

~detune.kr(1);
~detune.fadeTime=2;
~detune={SinOsc.kr(1/16).exprange(0.0001,0.005)};

~mod1.fadeTime=1/4;
~mod2.fadeTime=1/2;
~mod3.fadeTime=1/4;

~mod1 = {[1.5,4] * SinOsc.kr(4.2/[0.95,1.15]).range(1.0-~detune,1.0+~detune)};
~mod2 = {[8,4]};//*1.628};
~mod3 = {[1.5,1.33]/4};
)

~mel.rebuild;

(
  ~mel.fadeTime=4;
  ~mel.quant=2;
  ~mel={ 
    var freq = SinOsc.kr(40/(1..16).scramble,mul:40*LFNoise2.kr(4/(1..16)))+4320/~mod1*[2,4].scramble*[2,8].scramble/((~mod2*pi)*Duty.kr(~mod3*(1+((1..16)/16)).scramble,0,Dseq([1,2,1.5,1.25,0,2,0.5,0.25],inf)));
    var sig  = SinOsc.ar(freq,mul:LFTri.kr(~mod3/(1..16)).exprange(0.0001,0.2)); 
    sig = CombN.ar(sig,1/4,1/4.32/((1..16)/16).scramble,2);
    Splay.ar(sig,~width,~vol,SinOsc.kr(7/(1.628)).range(-0.5,0.5) );
  };
  ~mel.play;
);




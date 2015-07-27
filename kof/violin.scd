

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// player synth ///////////////////////////////////////

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin.aif");
// http://www.freesound.org/people/Spleencast/sounds/90862/

(
  ~violin.quant=2;
  ~violin.fadeTime=16.02;
  ~violin={
    var mod = [1,-0.5,0.25,-1,0.25,-0.5];
    var spread = 0.0001;
    var pos = LFDNoise1.kr(1/48/fib(6));

    var imp = Impulse.ar(3/4+(LFDNoise1.kr(1/8!6)*0.001),(1..6)/6);
    var env = EnvGen.ar(Env([0,LFDNoise1.kr(1/8!6),0],[1/75,1/15]*2,[2,-2]),imp);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod,imp,pos * BufFrames.kr(b.bufnum),1);

    sig = sig * (1/(1..6));
    sig = sig * env;
    sig = Vibrato.ar(sig,[3,4,5,6,7,8],0.04);
    sig = GVerb.ar(HPF.ar(sig,400),40)/4 + sig;
    sig = CompanderD.ar(sig,3/4,1/5,1/2);
    Splay.ar(sig.flat,0.5,0.25);
  };
  ~violin.play;
);
~violin.stop(32);



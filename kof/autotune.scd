

(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(2);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);

(

  ////////////
  var n = 64;
  ////////////

  // harmony synth ///////////////////////////////////////

  (
    ~harmony.ar(2);
    ~harmony.quant=2;
    ~harmony.fadeTime=8.2;
    ~harmony={
      //         |       |       |       |       |  
      var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
      var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
      var env = EnvGen.ar(Env([0.001,1,0.001],[0.25,[1,2,3,4]/2],[3,-3],curve:'exp'),imp * hit);
      var mod = Select.kr(PulseCount.kr(imp*hit)/4%4,[1,1.5,1.25,2]);
      var mod2 = Select.kr(PulseCount.kr(imp*hit)/(16)%4,[1,0.5,1.5,0.75]);
      var fs = (n).midicps/mod/(pi*mod2);
      var sig = LFSaw.ar(fs,SinOsc.kr(1/[1,2,3,4]).range(0,2),mul:0.5);
      sig = MoogFF.ar(sig,fs*4,2+[0.1,0.5,0.75,0.99]);
      sig = sig * env;
      sig = CombL.ar(sig,1/(4),1/(4),8)+sig;
      Splay.ar(sig,0.15,0.25);
    };
    ~harmony.play;
  );

  // harmony synth ///////////////////////////////////////

  (
    ~harmony2.ar(2);
    ~harmony2.quant=2;
    ~harmony2.fadeTime=0.2;
    ~harmony2={
      //         |       |       |       |       |  
      var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
      var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
      var env = EnvGen.ar(Env([0.001,1,0.001],[0.05,[1,2,3,4]/4],[3,-3],curve:'exp'),imp * hit);
      var mod = Select.kr(PulseCount.kr(imp*hit)/4%4,[1,1.5,1.25,2]);
      var mod2 = Select.kr(PulseCount.kr(imp*hit)/(16)%4,[1,0.5,1.5,0.75]);
      var fs = (n+24).midicps/mod/(pi*mod2);
      var sig = SinOsc.ar(fs,SinOsc.kr(1/[1,2,3,4]).range(-pi,pi),mul:0.5);
      sig = sig * env;
      Splay.ar(sig,0.15,0.15);
    };
    ~harmony2.play;
  );

  // kick synth ///////////////////////////////////////

  (
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=10.2;
    ~kick={
      //         |       |       |       |       |  
      var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
      var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
      var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
      var sig = SinOsc.ar(n.midicps/2pi+(env**100*n.midicps/pi));
      sig = sig * env;
      Splay.ar(sig,0.75,0.75);
    };
    ~kick.play;
  );


  // kick2 synth ///////////////////////////////////////

  (
    ~kick2.ar(2);
    ~kick2.quant=2;
    ~kick2.fadeTime=10.2;
    ~kick2={
      //         |       |       |       |       |  
      var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
      var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
      var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
      var sig = SinOsc.ar(n.midicps/([1,2,1.5,4]*2*pi)+(env**100*n.midicps/pi));
      sig = sig * env;
      Splay.ar(sig,0.15,0.5);
    };
    ~kick2.play;
  );

  // hh synth ///////////////////////////////////////

  (
    ~hh.ar(2);
    ~hh.quant=2;
    ~hh.fadeTime=20.2;
    ~hh={
      //         |       |       |       |       |  
      var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
      var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
      var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
      var sig = LFNoise2.ar(16000!2);
      sig = sig * env;
      sig = HPF.ar(sig,[1,2,4,8]*2000);
      Splay.ar(sig,0.75,0.25);
    };
    ~hh.play;
  );

  // hh synth ///////////////////////////////////////

  (
    ~hh2.ar(2);
    ~hh2.quant=2;
    ~hh2.fadeTime=20.2;
    ~hh2={
      //         |       |       |       |       |  
      var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
      var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
      var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
      var sig = LFNoise2.ar(16000!2);
      sig = sig * env;
      sig = HPF.ar(sig,[1,2,4,8]*2000);
      Splay.ar(sig,0.75,0.25);
    };
    ~hh2.play;
  );

  // switcher synth ///////////////////////////////////////

  (
    ~switcher.ar(2);
    ~switcher.quant=2;
    ~switcher.fadeTime=2.2;
    ~switcher={
      //         |       |       |       |       |  
      var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
      var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
      var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.002],[3,-3],curve:'exp'),imp * hit);
      var fq = n.midicps/pi*4;
      var sig = [
        SinOsc.ar(fq*4),
        Pulse.ar(fq*8),
        SinOsc.ar(fq*1.5),
        Pulse.ar(fq*16)
      ];
      sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
      sig = sig * env;
      Splay.ar(sig,0.15,0.05);
    };
    ~switcher.play;
  );


  // filter filter ///////////////////////////////////////
)

(
  (
  ~filter.quant=1;
  ~filter.fadeTime=1;
  ~filter={
    var high,mid,low;
    var sig = ~switcher.ar + ~kick.ar + ~kick2.ar + ~harmony.ar + ~harmony2.ar + ~switcher.ar;
    
    sig = GVerb.ar(LPF.ar(sig,2000)+HPF.ar(sig,250),100,[5,6],spread:[70,74])/8 + sig;
    low = CompanderD.ar(LPF.ar(sig,200),3/4,1/2.5,1/2);
    mid = CompanderD.ar(BPF.ar(sig,400,2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(DelayN.ar(sig,[0,1/2000]),0.25,0.15);
  };
  ~filter.play;
  );
)

~filter.clear

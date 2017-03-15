

p.push();
p.bpm(90);

(
    ~data.kr(3);
    ~data.mold(3);
    ~data={|x,y,a|[x,y,a].lag(1/30)};
    OSCdef(\receiver,{arg ... args;
        ~data.set(\x,args[0][1]);
        ~data.set(\y,args[0][2]);
        ~data.set(\a,args[0][3]);
    },\live);

  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
p.moveNodeToTail(\master);
);

// sonify_one synth ///////////////////////////////////////

(
    ~sonify_one.ar(2);
    ~sonify_one.clock = p.clock;
    ~sonify_one.quant=4;
    ~sonify_one.fadeTime=1;
    ~sonify_one={|x=0,y=0,a=0|
        var mod = Duty.kr(~tempo*[4,3,2],0,Dseq([1,2,1.5,1.33333],inf));
        var notes = [60,36,72,84,64,65,69,67,55,65,67,61].midicps / (y.round(1/8).range(1,8).reciprocal+1);
        var sel = Select.kr(x*notes.size,notes);
        var sig = SinOsc.ar(sel,Pulse.ar(y*~tempo));
        //sig = Resonz.ar(sig,x.range(sel/4,sel*[1,2,4,8]),y+0.01);
       // sig = sig;
        //sig = CombN.ar(sig,1/(y*note),1/(y*note),2);
        //[x,y,a].poll;
        //a.poll;
        Splay.ar(sig,0.5,0.15,x-0.5);
    };
    ~sonify_one.play;
);
~sonify_one.stop(4);
~sonify_one.clear;
~sonify_one.pause;
~sonify_one.resume;




b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/beat.wav");

// player synth ///////////////////////////////////////

(
    ~sonify_one.ar(2);
    ~sonify_one.quant=4;
    ~sonify_one.fadeTime=8.02;
    ~sonify_one={|x,y,a|
        var mod = y.lag(1/30/[1,2,100,200]).round(1/[4,1.5,8,16]);//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.01;
        var pos = x.lag(1/3);
        //         |       |       |       |       |  
        var pat = [1,1,1,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.001],[0.02,1.5]*a,[3,-3],curve:'exp'),imp * hit)} * (a**0.6);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.021),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  //sig = sig * env;
        Splay.ar(sig,0.75,0.65,x-0.5);
    };
    ~sonify_one.play;
);
~sonify_one.stop(7);
~sonify_one.clear;

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(1!2);
  sig = HPF.ar(sig,5000*[1,2,3,4],0.2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;
~kick.pause;
~kick.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Select.kr(~data.kr[2].lag(1/3)*6,[1,2,4,1/2,4,8])/2;
    var note = [24,60,36].midicps/[1,1.5,1.33333] * mod;
  var sig = SinOsc.ar(~data.kr[1].range(note/4,note*4).round(note),~data.kr[0].lag(1/8)) + SinOsc.kr(~tempo/[1,2,16]) * (1/[1,2,4])* Pulse.ar(~data.kr[2].lag(1/4)/[1,2,3,4,5,6]*~tempo.kr*2).softclip * ~data.kr[2];
  sig = Perlin3.ar(sig[0],sig[1],sig*sig[2]) * (~data.kr[2].softclip**1.72);
  sig = CombN.ar(sig,1/note,1/note,1/4);//~data.kr[2].range(1,4));
  sig = LPF.ar(sig,~data.kr[0].range(200,1600));
  
  Splay.ar(sig,0.05,0.15,~data.kr[1].lag(1/8).range(-0.5,0.5));
};
~one.play;
);
~one.stop(16);
~one.clear;
~one.pause;
~one.resume;


(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// test synth ///////////////////////////////////////

(
~test.ar(2);
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  WhiteNoise.ar(0.2),
  SinOsc.ar(500!2),
  LFSaw.ar(50)
  ];
  sig = Select.ar(~data.kr[0]*(sig.size+1),sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;

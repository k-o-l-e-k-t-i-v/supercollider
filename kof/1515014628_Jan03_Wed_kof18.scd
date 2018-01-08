

~tempo = {60/60};
p.makeTempoClock;
(
  //s.latency=0.2;
//  p.clock.tempo(97.2/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// one synth ///////////////////////////////////////

(
~one2.ar(2);
~one2.clock = p.clock;
~one2.quant=16;
~one2.fadeTime=4;
~one2={
    var mod = Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
  var sig = VarSaw.ar([150,300,600]+.x[0,0.01]/mod,0,Pulse.ar(~tempo*4/[1,2,3,4]));
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.15);
};
~one2.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


MIDIClient.init
MIDIClient.destinations;
m = MIDIOut(0);


( 
c.stop;
    c = Pbind( 
        \type, \midi, 
        \midicmd, \control, 
        \midiout, m, 
        \chan, 0, 
        \ctlNum, 1, 
        \control, Pseq((1..127),inf), 
        \delta, 0.01,
    ); 
c.play; 
) 


(
    Tdef(\ctl,{
        loop{
            m.control(0,2,120.rand);
            1.wait;
        }
    }).play;
)
Tdef(\ctl).stop;

(
    Tdef(\ctl2,{
        loop{
            m.control(0,3,120.rand);
            1.wait;
        }
    }).play;
)
Tdef(\ctl2).stop;

(
    Tdef(\ctl3,{
        loop{
            m.control(0,4,120.rand);
            1.wait;
        }
    }).play;
)

Tdef(\ctl3).stop;

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

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
            1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,1,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2,env**80*8pi) + VarSaw.ar(50,0,env**40,mul:0.5);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

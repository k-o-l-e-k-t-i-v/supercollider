p.push();


~tempo = {110/60};

// noisor synth ///////////////////////////////////////

(
~noisor.ar(2);
~noisor.quant=0;
~noisor.fadeTime=6;
~noisor={
    var prime = [1,5,[6,7,8].choose];
    var f = (2**(prime/12)+1) * [55,55*8,55*10];
    var fm = CombL.kr(MouseY.kr(0.1,1.0),(1..12)/~tempo,1/4/~tempo,16);
    var sig = LFSaw.ar(~tempo*[1/4,1/16],mul:2pi);
    var osc = SinOsc.kr(f,mul:fm) + CombL.kr(MouseX.kr(0,2pi)/10,(1..12)/~tempo,1/4/~tempo,16) + WhiteNoise.ar(MouseX.kr(0,0.5));
    sig = Perlin3.ar(sig[0].cos+1,sig[1].sin+1,osc);
    sig = CombL.ar(sig,1,[2,1.5]/f,4)/12 * LPF.ar(sig/32,2000);
    sig = LeakDC.ar(sig);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = HPF.ar(sig,600) + Resonz.ar(sig,f,0.1);
    sig = GVerb.ar(HPF.ar(sig,40),90,3)/92+sig;
    Splay.ar(sig,0.15,0.5);
};
~noisor.play;
);
~noisor.stop(30);
~noisor.clear;
~noisor.pause;
~noisor.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(45);};});
}.fork;  
)
s.scope;

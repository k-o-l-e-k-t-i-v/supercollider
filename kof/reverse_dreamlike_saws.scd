

s.boot;

(
  Ndef(\a).fadeTime = 4.0;
  Ndef(\a).quant = 2.0;
  Ndef(\a,{

    ~m = Duty.kr([4,8,16,32,64],0,Dseq([1,1.5,2,1.25,0.5],inf));
    ~sig = LFSaw.ar(43.2*[1,1.5,4,6,4*1.5]*(~m*pi)+LFTri.ar(4.32/(1..8)).range(-4.32/4,4.32/4),mul:0.5);

    //~sig = ~sig + SinOsc.ar(43.2*(2**(1..8)),mul:0.5);

    ~sig = ~sig * LFSaw.ar(4/(2**(1..64))).exprange(0.0001,1);
    ~sig = BBandPass.ar(~sig,LFTri.ar(1/4/(1..16)).exprange(22.01,19000).round(43.2/pi),0.75);
    ~sig = Resonz.ar(~sig,LFTri.ar(1/5/(1..16)).range(22,6200).round(43.2/pi)) ;
    ~sig = LPF.ar(~sig,800+SinOsc.ar(1/11/(1..8)).range(1,300));
    ~sig = CompanderD.ar(~sig,0.5,1,1/10);
    ~sig = Mix.ar(~sig);
    ~sig = PitchShift.ar(~sig,~m);
    ~sig = CombN.ar(~sig,3,4.01,32);
    ~sig = ~sig.tanh;
    ~sig = FreeVerb2.ar(~sig.distort,~sig.distort,0.133,100);

    Splay.ar(Limiter.ar(~sig,0.95,0.02),0.5,1,0.5);

  }).play;
  Ndef(\a).mold(2);
)


//what's mold? it doesn't work for me
// ERROR: Message 'mold' not understood
//alex
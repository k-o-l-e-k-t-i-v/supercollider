

s.boot;
p=ProxySpace.push(s);

(
~a.quant=2;
~a.fadeTime=2;
    ~a={
    var mel = Duty.kr(8,0,Dseq([1,1.5,1.25,1.125,1.75,0.75,0.5],inf));
    var cut = LFTri.ar(1/8/fib(4,2,3)).pow(4).range(120,1200);
    
    var trig = Impulse.kr(1/8,(0..3)++[0.5,1.5,2.5,3.5]/4);
    var env = Linen.kr(trig,8,1,0.175);
    var sig = VarSaw.ar(43.20*([1,1.5,4,2]*(pi/mel))*(1.0001**(1..8)),mul:0.0475) * env;
    sig = RLPF.ar(sig,LFTri.ar(1/4/fib(8,1,3)).range(cut,250)*(env.pow(1.2)*2+1),0.25);
  
    trig = Impulse.kr(1/4,(0..3)++3.5/4);
    env = Linen.kr(trig,0.0025,1,1.75);
    sig = SinOsc.ar(43.2*(env.pow(8)*2+1))*env+sig;
 
    trig = Impulse.kr(1/8,(0..3)+0.5++[0.5,2.5]/4);
    env = Linen.kr(trig,0.005,1,0.75);
    sig = BPF.ar(PinkNoise.ar(0.2!2),(env.pow(12)*1000+800))*env+sig;

    sig = CompanderD.ar(sig,0.9,1/1.5,1/10);
    sig = FreeVerb.ar(sig,0.133,100.5);
    Splay.ar(sig,0.3);
};
~a.play;
)


(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
    ~voice1.quant=2;
    ~voice1.play;
    ~voice1.fadeTime=5;
    ~voice1={|input|
        var notes,code,sig,freq,speed,mod;


       //////////////////|/////////|/////////|/////////|/////////|////////| 
        code="!##$~!~!~!!";
       //////////////////|/////////|/////////|/////////|/////////|////////| 
        
        
        code=code.ascii;
        
        notes = (code).linexp(20,127,50,1600);
        speed = 1/8/(1..8);
        mod = 1.25/(1..8);
        freq = Duty.ar(speed,0,Dseq(notes,inf)).lag(speed/2*mod);
        sig = SinOsc.ar(freq!2,mul:0.2) + LFNoise2.ar(freq*2,freq.linlin(50,10000,1,0));
        sig = sig + Formant.ar(freq!2,freq.lag(0.2*speed*mod),freq.lag(0.1*speed*mod)*2,0.09);
        Splay.ar(sig,0.7,0.0129,SinOsc.ar(4)/3);
    };
)
(
    ~voice3.quant=2;
    ~voice3.play;
    ~voice3.fadeTime=5;
    ~voice3={|input|
        var notes,code,sig,freq,speed,mod;


       //////////////////|/////////|/////////|/////////|/////////|////////| 
        code="!##$          AAAAAAAAAA                  ";
       //////////////////|/////////|/////////|/////////|/////////|////////| 
        
        
        code=code.ascii;
        
        notes = (code).linexp(20,127,500,16000) / 1.333333;
        speed = 1/8/(1..8);
        mod = 1.25/(1..8);
        freq = Duty.ar(speed,0,Dseq(notes,inf)).lag(speed/2*mod);
        sig = SinOsc.ar(freq!2,mul:0.2) + LFNoise2.ar(freq*2,freq.linlin(50,10000,1,0));
        sig = sig + Formant.ar(freq!2,freq.lag(0.2*speed*mod),freq.lag(0.1*speed*mod)*2,0.09);
        Splay.ar(sig,0.7,0.0229,SinOsc.ar(4)/3);
    };
)
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(60)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};
(
    ~voice2.quant=2;
    ~voice2.play;
    ~voice2.fadeTime=10;
    ~voice2={|input|
        var notes,code,sig,freq,speed,mod;


       //////////////////|/////////|/////////|/////////|/////////|////////| 
        code="x0x0x0x0x0x          AAAAAAAAAA                     ~~~~!~~~";
       //////////////////|/////////|/////////|/////////|/////////|////////| 
        
        
        code=code.ascii;
        
        notes = (code).linexp(20,127,50,15000)/1.3333/1.5/1.5/1.5/1.5/1.25/1.33333;
        speed = 1/4*[1,2,4,8,16,32,64]*16;
        mod = 1.25/(1..8);
        freq = Duty.ar(speed,0,Dseq(notes,inf)).lag(speed/2*mod) + SinOsc.kr(1/4/(1..8),mul:8pi);
        sig = SinOsc.ar(freq!2,mul:0.2) + LFNoise2.ar(freq*2,freq.linlin(50,10000,1,0)) * LFSaw.ar(1/32/speed).pow(40);
        sig = sig + Formant.ar(freq!2,freq.lag(0.2*speed*mod)*3,freq.lag(0.1*speed*mod),0.09);
        sig = sig + LPF.ar(LFNoise2.ar(10000!8),16000,mul:0.01);
        sig = NumChannels.ar(sig,2);
        sig = CombN.ar(sig,1/[40,41],1/5,6);
        sig = Limiter.ar(sig);
        Splay.ar(sig,0.27,0.19/2,SinOsc.ar([5,4,6]));
    };
)

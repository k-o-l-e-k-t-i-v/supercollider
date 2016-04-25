
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
        code="
        ^^^^^^^^^^^^^^^^^^^~)))))))!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^ddddddddddrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^^^rrrrrrrddddddddrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttrrttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#dddddddddddttttttttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####ttttttttttttttttttttt^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!^^^^^^ssssssssssssssrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!aaz^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^aaaaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^#####^^^^~^^^^^^^!^^^zz^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^####...................z.^^^rrrrr a message rrrr^
        ^xxxxx4^^^####z....................^^^rrrrr in sound  rrrr^
        ^xxxxx4^^^####.....................^^^rrrrr SETI ???? rrrr^
        ^xxxxx4^^^####.....................^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^####..........AAAAAAAAAAAAAAAAAAAAArrrrrrrrrrrrr^
        ^xxxxx4^^^####.zzzzzzzzzzzzzzzzzzz.^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx4^^^####.....................^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####.....................^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxAAAAAAAAAAAAAAAAAAA............^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####.....................^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^####.......AAAAAAAAAAAAAAAAAAAAAAAAAAArrrrrrrrrr^
        ^xxxxx^^^^####.....................^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ^xxxxx^^^^#####^^^^~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        AAAAAAAAAAAAAAAAAAA~^^^^^^^!^^^^^^^^^^rrrrrrrrrrrrrrrrrrrr^
        ";
       //////////////////|/////////|/////////|/////////|/////////|////////| 
        
        
        code=code.ascii;
        
        notes = (code).linexp(20,127,50,16000);
        speed = 1/8/(1..8);
        mod = 1.25/(1..8);
        freq = Duty.ar(speed,0,Dseq(notes,inf)).lag(speed/2*mod);
        sig = SinOsc.ar(freq!2,mul:0.2) + LFNoise2.ar(freq*2,freq.linlin(50,10000,1,0));
        sig = sig + Formant.ar(freq!2,freq.lag(0.2*speed*mod),freq.lag(0.1*speed*mod)*2,0.09);
        Splay.ar(sig,0.7,0.009,SinOsc.ar(4)/3);
    };
)

~voice1.stop;

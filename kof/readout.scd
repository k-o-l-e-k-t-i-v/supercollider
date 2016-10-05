Quarks.install("https://github.com/supercollider-quarks/OpenObject.git")
OpenObject.start;
OpenObject.openInterpreter;



a="ahoj jak se mas dnes";
(
    ~voice1.quant=0;
    ~voice1.play;
    ~voice1.fadeTime=0.02;
    ~voice1={|input|
        var notes,code,sig,freq,speed,mod;
        var env;


        //////////////////|/////////|/////////|/////////|/////////|////////| 
        code="
        hoj všichni, v Kauflandu už začali prodávat čokoládový Mikuláše a adventní
        kalendáře, takže i my bychom se měli začít domlouvat na letošním výjezdu na
        silvestra. Vzhledem k tomu, že potřebujeme být s Alešem ideálně v regionu
        jižní Čechy, protože máme brzo v lednu verni v Domě umění v Budějicích,
        zvolili jsme již předběžně s více lidma pro letošek Šumavu.
        ";
        //////////////////|/////////|/////////|/////////|/////////|////////| 


        code=code.ascii;


        notes = (code).linexp(20,127,300,5500);
        speed = 1/64;///(1..8);
        env = EnvGen.kr(Env([0,1,1,0],[0.02,speed*a.size,0.1],[-3,1]));
        mod = 1.5/(1..8);
        freq = Duty.ar(speed,0,Dseq(notes,inf)) * LFTri.ar(1/speed);//.lag(speed/2*mod);
        sig = SinOsc.ar(freq!2,mul:0.2) + LFNoise2.ar(freq*2,freq.linlin(50,10000,1,0));
        sig = sig + Formant.ar(freq!2,freq*2,freq,0.09);
        //sig = sig * env;

        Splay.ar(sig,0.7,0.9);
    };
    ~voice1[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,1300),15000),[4000,4010],1/10)/4+sig};
)
~voice1.clear;

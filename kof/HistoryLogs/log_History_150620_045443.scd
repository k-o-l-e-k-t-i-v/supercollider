// History, as it was on Sat Jun 20 04:54:43 2015.

[
[ 0, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60].midicps,mul:0.2);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 10.494501768, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 32.125163871, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 52.252442713, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 61.888594158, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 68.683050859, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 109.528990562, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 123.347841719, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = RLPF.ar(sig,LFDNoise1.kr(4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 129.710426179, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 155.951780686, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 159.251150606, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 162.474208706, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 179.292452158, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 188.100094055, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 202.149396732, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps/2,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 214.534193439, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/0.5pi,mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 252.986438466, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/(LFDNoise0.ar(0.25,2).round(0.5)*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 258.778914587, 'me', "thisProcess.stop;" ],
[ 263.721938867, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/(LFDNoise0.ar(1).range(0.25,2).round(0.5)*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 268.579843828, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/(LFDNoise0.ar(1!8).range(0.25,2).round(0.5)*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 274.56848871, 'me', "(
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/(LFDNoise1.ar(1!8).range(0.25,2).round(0.5)*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 277.231822312, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/(LFDNoise1.ar(4!8).range(0.25,2).round(0.5)*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 280.853001269, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/(LFDNoise1.ar(1/4!8).range(0.25,2).round(0.5)*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 299.490206174, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/(0.5*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 302.72226115, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*2/(1.5*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 308.319683029, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/(1.5*pi),mul:0.4);
  sig = sig*LFTri.ar(1/4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 321.546329677, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/(1.5*pi),mul:0.4);
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.1,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 341.803099222, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/(1.5*pi),mul:0.4);
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = BPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 354.856555017, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/(1.5*pi),mul:0.4);
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 375.97405088, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/(1.5*pi),mul:LFDNoise1.kr(1!8));
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 392.084994677, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/(1.5*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 399.519093091, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/(2pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 417.854380478, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/([1.5,2,0.5]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 428.667688738, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([55,58,60,48,36,72,52].midicps*4/([1.5,2,1.25]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 436.487773348, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([58,60,48,36,72].midicps*4/([1.5,2,1.25]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(4/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 448.111346487, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([58,60,48,36,72].midicps*4/([1.5,2,1.25]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(44/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 461.433712664, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([58,60,48,36,72].midicps*4/([1.5,2,1.25]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 485.561183557, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar([58,60,48,36,72].midicps*4/([1.5,2,1.25]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 511.206764254, 'me', "(
~echoefil.quant=2;
~echoefil.fadeTime=5;
~echoefil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~echoefil.play;
);" ],
[ 535.39979034, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]+12).midicps*4/([1.5,2,1.25]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 544.185732142, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]-12).midicps*4/([1.5,2,1.25]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 551.230983576, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]-12).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 558.865249841, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 561.077037479, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]+7).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 567.529834641, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]-7).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 577.094291829, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 583.048623208, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(1/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 590.550573657, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(2/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 594.70838224, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(2/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 602.862258325, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(2/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 608.687778089, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(2/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 617.292265835, 'me', "(
~echoefil.quant=2;
~echoefil.fadeTime=5;
~echoefil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~echoefil.play;
);" ],
[ 622.267182641, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig*LFTri.ar(2/fib(8)).exprange(0.00001,1);
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 643.281593075, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 648.721083389, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36,72]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 658.863321505, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,36]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 662.701060782, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,55]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 668.58208885, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,54]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 672.49949651, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([58,60,48,56]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 680.688334898, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([63,60,48,56]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 692.025924886, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([63,60,48,55]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 696.142961533, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([63,60,48,58]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 704.86244293, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([63-7,60,48,58]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 709.364537449, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([63+12,60,48,58]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 718.357011274, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*4/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 727.891519831, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 757.238411894, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + (SinOsc.ar(72)*Pulse.ar(4)/4);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 769.609689336, 'me', "(
~echoefil.quant=2;
~echoefil.fadeTime=5;
~echoefil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~echoefil.play;
);" ],
[ 774.794282427, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + (SinOsc.ar(72)*Pulse.ar(4)/4);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 789.914356681, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + (SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 830.749194666, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + (SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.2!2),8000)*Pulse.ar([1,2,3,4]/1.5)/4);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 840.275159273, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + (SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.1!2),8000)*Pulse.ar([1,2,3,4]/1.5)/4);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 856.82397976, 'me', "(
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.1!2),8000)*Pulse.ar([1,2,3,4]/1.5)/4);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 860.037937398, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + (HPF.ar(WhiteNoise.ar(0.1!2),8000)*Pulse.ar([1,2,3,4]/1.5)/4);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 877.762128008, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),8000)*Pulse.ar([1,2,3,4]/1.5)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 879.170591288, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),8000)*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 901.703841376, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4).exprange(1000.001,10000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 914.267970008, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,10000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 922.918578673, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 926.542921533, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 935.203257602, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.2,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 942.090550791, 'me', "(
~echoefil.quant=2;
~echoefil.fadeTime=5;
~echoefil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.12);
};
~echoefil.play;
);" ],
[ 950.649779939, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8);
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 957.327649078, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar(72)*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 974.814006896, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 991.833579883, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  //sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 999.387529303, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1013.019489216, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]-12).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1021.04308263, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58]-7).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1028.393541094, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60,48,58-7]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1035.211998961, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60-7,48,58-7]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1042.07373045, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60+12,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1053.497074498, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48+7,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1069.79719931, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1085.732438104, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1094.542915967, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1107.720814396, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = SinOsc.ar(([60,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1120.2258229, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = VarSaw.ar(([60,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = Resonz.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1137.472896731, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = VarSaw.ar(([60,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1146.276527846, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1158.327364269, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58-7]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1168.787405392, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58-7]-12).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1175.442627304, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1184.097004457, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*1.5/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1188.814915001, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*1.25/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1192.57766405, 'me', "(
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*1.125/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1204.489064119, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*1.25/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1209.702892759, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*1.5/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1215.801698905, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*1/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1221.535686424, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1224.670868063, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*2.25/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1229.25961367, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]+12).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1233.237023711, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,58]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1240.372974789, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48+7,58]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1243.733617021, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,60-7,48,55]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1253.617525381, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,10)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1276.747810451, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1283.394498189, 'me', "(
~echoefil.quant=2;
~echoefil.fadeTime=5;
~echoefil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.12);
};
~echoefil.play;
);" ],
[ 1291.55388993, 'me', "(
~echoefil.quant=2;
~echoefil.fadeTime=5;
~echoefil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.12);
};
~echoefil.play;
);" ],
[ 1304.428959453, 'me', "(
~echoefil.quant=2;
~echoefil.fadeTime=5;
~echoefil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.12);
};
~echoefil.play;
);" ],
[ 1312.475541783, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/2,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1321.6070439, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4]/1.25)/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1331.262456058, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,3,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1342.44847595, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([1,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1355.329752976, 'me', "(
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1365.54511298, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*1.25/([1,2]*0.5pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1374.683080691, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*1.25/([1,2]*0.25pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1379.237875605, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*1.5/([1,2]*0.25pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1387.598074705, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*1/([1,2]*0.25pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1394.99794509, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*1/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1401.298899139, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1421.746125273, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = CombN.ar(sig,1,1,16)/2+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~echoes.play;
);" ],
[ 1433.097375796, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = CombN.ar(sig,1,1,16)/2+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1440.012804041, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = CombN.ar(sig,0.04,0.04,16)/2+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1450.68045116, 'me', "(
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = CombN.ar(sig,0.04,0.03,16)/2+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1452.973127122, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = CombN.ar(sig,0.04,0.041,16)/2+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1457.569268229, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = CombN.ar(sig,0.04,0.045,16)/2+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1459.133167077, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = CombN.ar(sig,0.04,0.045,1)/2+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1463.635222127, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = CombN.ar(sig,0.04,0.045,0.25)/2+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1475.618767324, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.04,0.045,0.25)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1484.269541271, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.04,0.0405,0.25)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1491.708102194, 'me', "(
~echoes.quant=2;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.04,0.0405,0.085)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1501.750011504, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.04,0.0205,0.085)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1505.048393102, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.14,0.0205,0.085)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1513.891246769, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.24,0.0205,0.085)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1517.129613222, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.24,0.00205,0.085)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1522.833179035, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.24,0.00205,0.185)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1530.126929215, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.24,0.00205,0.085)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1533.648128583, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.24,0.00105,0.085)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1540.826949636, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4])/4,[4,5,6],0.2);
  sig = sig + Vibrato.ar(HPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4/fib(4)).exprange(1000.001,15000))*Pulse.ar([3,2,1.5,4])/4,[5,6,7],0.2);
  sig = CombN.ar(sig,0.24,0.0105,0.085)/2+sig;
  sig = AllpassN.ar(sig,1,1,8)/4+sig;
  sig = FreeVerb.ar(sig,0.12,100)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~echoes.play;
);" ],
[ 1548.294992278, 'me', "(
~echoes.quant=2;
~echoes.fadeTime=5;
~echoes={
  var sig = LFSaw.ar(([60,65,48,55]).midicps*2/([1,2]*pi),mul:LFDNoise1.kr(1/4!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = MoogFF.ar(sig,LFDNoise1.kr(1/4!8).range(55,12000)) + RLPF.ar(sig,LFDNoise1.kr(1/4!8).range(55,1200));
  sig = sig + Vibrato.ar(SinOsc.ar([72,50,66,90])*Pulse.ar([1,2,3,4]*2)
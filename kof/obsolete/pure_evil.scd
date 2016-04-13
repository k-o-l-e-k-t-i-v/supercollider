


(
Ndef(\p).fadeTime = 5.0;

Ndef(\p,{|spread = 22|Splay.ar(VarSaw.ar(VarSaw.kr(33).exprange(11,4440).lag({ExpRand()}!8) + {ExpRand()*spread}!16,{ExpRand()*spread}!16),1,0.1)}).play;

Ndef(\aaa,{VarSaw.kr(11).exprange(44,9999).lag({ExpRand()!8})});

Ndef(\p).map(\spread,Ndef(\aaa));
)


s.scope;
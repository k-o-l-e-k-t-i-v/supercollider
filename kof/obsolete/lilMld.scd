

(
~frq.quant=2;
~frq.fadeTime=0.1;
~frq={((LFDNoise0.kr(1/[1,2,4,8]).range(36.01,90).round(12))+[0,-24]+Duty.kr(1/[2,1],0,Dseq([3,5,7,[0,1]],inf))).midicps.flat;};
~frq.mold(2);

~pqpq.quant=2;
~pqpq.play;
~pqpq.mold(2);
~pqpq={SinOsc.ar(~frq.kr*(1.0001**(1..8)),mul:0.5) * (Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),4 )**2)};
)
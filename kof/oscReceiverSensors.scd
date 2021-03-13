(
    ~data.kr(3);
    ~data.mold(3);
    ~data={|x,y,z|[x,y,z].lag(1/30)};
    OSCdef(\accelerometer,{arg ... args;
 //       args.postln;
        ~data.set(\x,args[0][1]/10.0);
        ~data.set(\y,args[0][2]/10.0);
        ~data.set(\z,args[0][3]/10.0);
    },\accelerometer,recvPort:9000);


)



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(~data*500);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


p.push();
(
    n = NetAddr("127.0.0.1",10000);
    //n = NetAddr("127.0.0.1",34651);
    OSCFunc({|msg| msg.postf;},'/seekBar1',n);
)
OSCFunc.trace(false);

String.help

p.push();
~a={|val=0|val};
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={|a,b,c,d|
  var sig = SinOsc.ar(b.range(50,5000)) * Pulse.ar(c.range(70,240)/60) * SinOsc.ar(d.range(10,500));
  Splay.ar(sig,0.5,a);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
(
    thisProcess.openUDPPort(10000);
    f = { |msg, time, addr|
        var pattern = (msg[0].asString.split($/))[1];
        var value =  ((msg[0].asString.split($/))[2]);

        //pattern.postln;
        if(pattern == "seekBar1") {
            //"time: % sender: %\nmessage: %\n".postf(time, addr, msg);
            //"ctl: % val: %\n".postf(pattern,value.asFloat/100.0);
            ~one.set(\a,value.asFloat/100.0);
        };

        if(pattern == "seekBar2") {
            ~one.set(\b,value.asFloat/100.0);
        };
        if(pattern == "seekBar3") {
            ~one.set(\c,value.asFloat/100.0);
        };
        if(pattern == "seekBar4") {
            ~one.set(\d,value.asFloat/100.0);
        }};
        thisProcess.addOSCRecvFunc(f);
    );

    thisProcess.removeOSCRecvFunc(f);
    // noised synth ///////////////////////////////////////


n.sendMsg('/bang',120);

(
  n = NetAddr("127.0.0.1", NetAddr.langPort);
  OSCFunc.newMatching({|msg,time,addr|
    ("reseting clock, new tempo:"+msg[1]).postln; 
    p.clock.sched(0,{
      p.makeTempoClock(msg[1]/60);
    })

  }, '/bang',n);
)



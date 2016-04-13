

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

// test proxy for NodeProxies
p
// reduce them
p.clean


(
    z=true;
    x={|inp=nil,fade=0.02|
       p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]); if(snth!=inp){snth.stop(fade);z=z.not;if(z){snth.fadeTime=fade;snth.rebuild;snth.play();}};};
      };
)


~a.play;
~b.play;
~a={SinOsc.ar(440,mul:0.2)};
~b={LFSaw.ar(440,mul:0.2)};



//hard solo
x.value(~b)
//unsolo again
x.value(~b)

//solo unsolo w/ fade
x.value(~b,4)

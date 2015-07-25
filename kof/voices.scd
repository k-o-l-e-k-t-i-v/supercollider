/*
 #             ""#           #        m      "          
 #   m   mmm     #     mmm   #   m  mm#mm  mmm    m   m 
 # m"   #" "#    #    #"  #  # m"     #      #    "m m" 
 #"#    #   #    #    #""""  #"#      #      #     #m#  
 #  "m  "#m#"    "mm  "#mm"  #  "m    "mm  mm#mm    #   
                                                        
               ""#                               
m     m  mmm     #     mmm    mmm   mmmmm   mmm  
"m m m" #"  #    #    #"  "  #" "#  # # #  #"  # 
 #m#m#  #""""    #    #      #   #  # # #  #"""" 
  # #   "#mm"    "mm  "#mm"  "#m#"  # # #  "#mm" 
 */


//Fri Jul 24 19:10:20 CEST 2015

(
    p=ProxySpace.push(s.reboot);
    e=ProxySubmix.new(\filter);
);

// starting_one synth ///////////////////////////////////////

(
    ~starting_one.quant=1;
    ~starting_one.fadeTime=4.02;
    ~starting_one={
        var env = EnvGen.ar(Env([0,1,0],[0.002,0.95],[3,-3]),Impulse.ar(1,(0..3)/4));
        var sig = Formant.ar(432 * 16 * 1.5 / ([1,2,1,1.5]*2pi) + (env**0.1*10) + SinOsc.ar(43.2/fib(8)).range(-4,4),43.2*[1,2,4],1200,mul:0.75);
        sig = sig * env * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) + (HPF.ar(WhiteNoise.ar(0.1!2),[800,8000,14000])*Pulse.ar(4/fib(8))*0.3);
        sig = Vibrato.ar(sig,[3,4,5,6],0.2);
        sig = GVerb.ar(HPF.ar(sig,800),10)/2+LPF.ar(sig,800);
        Mix.ar(sig) * 0.0000375;
    };
    e.addMix(~starting_one,postVol:true);
    ~starting_one.play;
);
~starting_one.stop(7);
~starting_one.clear;


// filt filter ///////////////////////////////////////

(
~filt.quant=1;
~filt.fadeTime=4;
~filt={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,40)/16 + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/4,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Mix.ar(sig * 0.125);
};
~filt.play;
);
~filt.stop(7);
~filt.clear;


//Fri Jul 24 19:33:20 CEST 2015





p.push();

p.bpm(88);
// delays synth ///////////////////////////////////////

(
~delays.ar(6);
~delays.quant=4;
~delays.fadeTime=0.02;
~delays={
    var mod = Duty.kr([1,2,3,4,5]/4/~tempo,0,Dseq([1,2,1.5,1.33333,10,1/2,1/4],inf));
    var notes = [60,65,60,65,67,36].midicps/mod;
    var input = Amplitude.ar(SoundIn.ar([0,1,2,3,4,5]),0.005,1/12.495);
    
  var sig = LFSaw.ar(notes!6+(input*notes/100),mul:0.65) * input;
  //sig = CombL.ar(sig,input+1/notes,input+1/notes,1)/4+sig/2;
  //sig = CompanderD.ar(sig,3/4,1/1.5,2);
  //sig = []++(DWGReverbC1C3.ar([sig[0],sig[1],sig[2],sig[3],sig[4]],500,1/10)/10 ++ sig[5]) +sig;
  //Splay.ar(sig,0.5,0.25);
  sig = DWGReverbC1C3.ar(HPF.ar(LPF.ar([]++(sig[0]++sig[1]),3500),250),500,1/3)*0.12+LPF.ar(sig,5000);
  sig.softclip/100;
};
~delays.play;
);
~delays.stop(4);
~delays.clear;
~delays.pause;
~delays.resume;

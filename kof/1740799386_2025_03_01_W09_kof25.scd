

p.push();

p.bpm(105);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=2;
~one={
    var chord = Duty.kr(4/~tempo,0,Dseq([[1,5,8],[1,12,5],[1,5,8],[1,5,7]],inf));
    var mod = Duty.kr([8,16,32]/~tempo,0,Dseq([0,-1,0,1],inf));
    var note = [50,60] * (2**(chord+mod/12+1));//*.x Duty.kr([12,3,4]/~tempo,0,Dseq([1,3/4,4/3,1/2,1.5,1/1.33333,1/8,1.5,1/2].scramble,inf));
    var seek = LFSaw.ar([~tempo/24,~tempo/32/(2**(chord/12+1)),note/[2,4,8]])*2pi+LFNoise1.ar(1/4!3,mul:10);
    var scal = LFTri.ar([1,2,3]/16/[1,2,3],mul:2);
    var noi = Perlin3.ar(seek[0].cos+1*scal[0],seek[1].sin+1*scal[1],seek[2].sin+1*scal[2]);
    var sig = SinOsc.ar(note,noi*2pi,mul:LFTri.kr(~tempo/4/[1,2,3])**2);
    sig = CombL.ar(sig,1/~tempo,1/~tempo,1);
    sig = CompanderD.ar(HPF.ar(sig,40),3/4,1/2,1);
    sig= GVerb.ar(HPF.ar(sig,120),3,90)/16+sig;
    Splay.ar(sig,LFTri.kr(~tempo/36),0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

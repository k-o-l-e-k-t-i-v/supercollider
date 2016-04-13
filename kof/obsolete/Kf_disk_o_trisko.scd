
 /////////////////////////////////////////////////////////////////////// _ # X //
//                                                                              //
//     #    "           #       mmmm    m             "           #             //
//  mmm#  mmm     mmm   #   m  m"  "m mm#mm   m mm  mmm     mmm   #   m   mmm   //
// #" "#    #    #   "  # m"   #    #   #     #"  "   #    #   "  # m"   #" "#  //
// #   #    #     """m  #"#    #    #   #     #       #     """m  #"#    #   #  //
// "#m##  mm#mm  "mmm"  #  "m   #mm#    "mm   #     mm#mm  "mmm"  #  "m  "#m#"  //
//                                                                              //
 //////////////////////////////////////////////////////////  by kof /////////////


////  1  ////////////////////////////////////////////////////////////////////////////// >


(

Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{
	var tempo;
	tempo = 2;
	Splay.ar(
		Blip.ar([220,440,880,880*1.5]/1.5+LFNoise0.kr(0.1!8).range(-4,4),LFSaw.ar([1,2]*tempo/2.01,SinOsc.kr([0.1,0.2,0.4,0.8]/10.0)*2pi).range(1,120),0.35)

)}).play;

Ndef(\a)[1] = \filter -> {|in| Vibrato.ar(in,(1..8),0.195)};
Ndef(\a)[2] = \filter -> {|in| in.distort * LFPulse.ar(tempo*[1,2,3,5,8]/2)};
Ndef(\a)[3] = \filter -> {|in| FreeVerb.ar(in,0.773,10,add:in)};
Ndef(\a)[4] = \filter -> {|in| RLPF.ar(in,SinOsc.kr(0.07111).range(22,12222),mul:0.25,add:in)};
Ndef(\a)[5] = \filter -> {|in| Pan2.ar(in,SinOsc.kr(0.02111).range(0.1,0.9))};
)


//////  2  //////////////////////////////////////////////////////////////////////////// >

(

Ndef(\b).fadeTime = 2.0;
Ndef(\b).quant = 2.0;
Ndef(\b,{
	Splay.ar(
		Pan2.ar(
		BPF.ar(
				OnePole.ar(WhiteNoise.ar(0.66!8),SinOsc.kr([0.03,0.08]).range(0.1,0.9)) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),{ExpRand()*0.5}!8)
			,2200+LFNoise0.ar(2!4).range(-400,4000).lag(0.0001))
		,SinOsc.kr(2.01))

)}).play;


Ndef(\b)[1] = \filter -> {|in| Vibrato.ar(in,(1..8),0.5)};
Ndef(\b)[2] = \filter -> {|in| FreeVerb.ar(in,0.1373,100,add:in)};
Ndef(\b)[3] = \filter -> {|in| RHPF.ar(in,SinOsc.kr(0.1111).range(2222,12222),mul:0.75,add:in)};
Ndef(\b)[4] = \filter -> {|in| Pan2.ar(in,SinOsc.kr(0.2111).range(0.1,0.9))};
)

///////////  3  /////////////////////////////////////////////////////////////////////// >

(
Ndef(\c).quant = 2.0;
Ndef(\c).fadeTime = 2.0;

Ndef(\c,{
	var lfo,sig1;
	lfo = SinOsc.kr(1/8).range(0.00001,0.2);
	sig1 = SinOsc.ar([99,99.1],LFNoise0.ar(1/2!8).lag(lfo)*8pi,mul:0.75) * Decay.ar(Impulse.ar(8/[1,2,3,5,8]),0.35);

	Splay.ar(
		sig1
)}).play;

Ndef(\c)[1] = \filter -> {|in| Vibrato.ar(in,6+(1/[1,2,4,8]),0.1/[1,2,4,8])};
Ndef(\c)[2] = \filter -> {|in| FreeVerb.ar(in,0.233,10,mul:0.93,add:in/2)};
Ndef(\c)[3] = \filter -> {|in| RLPF.ar(in,SinOsc.ar([77,77.1]).range(110,2000),mul:0.33,add:in)};

)


//////////////////////////////////////////////////////////////////////////////////

s.boot;
(
  Tdef(\tt,{
    loop{
      
      Ndef(\a).fadeTime = 1;
      Ndef(\a).quant = 0;
      Ndef(\a,{

        ~a = [0,3,5,7,8];
        ~b = [2,5,7,7,7];
        ~c = [0,3,7,8,10];
        ~d = [0,2,5,8,8];
        ~e = [0,2,3,7,7];
        ~f = [0,3,5,8,8];
        ~g = [2,3,7,10,10];


        ~sel = 0.rrand(6);
        
        ~octave = ~sel * 12;

        ~gr = [~a,~b,~c,~d,~e,~f,~g].at(~sel);

        ~mod1 = ~gr.at(0.rrand(4!3))+~octave;


        ~sig1 = SinOsc.ar((~mod1).midicps,mul:0.2);

        Splay.ar(
          ~sig1 
          ,0.5,0.5,0.5)
      }).play;
      1.wait;
    }
  }).play;
)

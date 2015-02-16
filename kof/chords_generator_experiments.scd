
s.boot;
(
  Tdef(\tt,{
    loop{
      
      Ndef(\a).fadeTime = 1;
      Ndef(\a).quant = 0;
      Ndef(\a,{

        ~a = [0,3,7];
        ~b = [0,4,7];
        ~c = [2,5,8];
        ~d = [2,5,9];
        ~e = [3,7,10];
        ~f = [4,7,11];
        ~g = [0,5,8];


        ~octave = 0.rrand(4) * 12;

        ~sel = 0.rrand(6);

        ~mod1 = [~a,~b,~c,~d,~e,~f,~g].at(~sel);

        ~tone1 = 48+~octave+(~mod1);


        ~sig1 = LFSaw.ar((~tone1).midicps,mul:0.2);

        Splay.ar(
          ~sig1 
          ,0.5,0.5,0.5)
      }).play;
      2.wait;
    }
  }).play;
)

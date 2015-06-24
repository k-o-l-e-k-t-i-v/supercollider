// History, as it was on Sun Jun 21 21:46:12 2015.

[
[ 0, 'me', "(
    ~happybirthdaysong.quant=2;
    ~happybirthdaysong.fadeTime=1;
    ~happybirthdaysong={
        var sig;
        var mel = [];
        var melod = [10,10,12,10,15,14,
                     10,10,12,10,17,15,
                     10,10,19,15,14,12,
                     20,20,19,15,17,15];
        var durs = ([1/4,1/4,1,1/2,1/2,1]!3++[1/4,1/4,1,1/2,1/2,8]).flat*1.5;
        var notes = [\"A\",\"#A\",\"B\",\"C\",\"C#\",\"D\",\"D#\",\"E\",\"F\",\"F#\",\"G\",\"G#\"];
        var freqs = [];
        var freq = 432;
        var factor = (2.0).pow(1.0/12.0);
        25.do{|i|
              freq = freq * factor;
              (i+\"\"+notes.at(i%notes.size)+\"\"+freq).postln;
              freqs = freqs ++ freq;
             };
        
        melod.collect({|i| mel=mel++freqs.at(i); });
        mel = Duty.kr(Dseq(durs,inf),0,Dseq(mel,inf)).lag(1/4);
        sig = SinOsc.ar(mel+SinOsc.ar(1/4/fib(6)).range(-4,4),mul:0.25);
        sig = Resonz.ar(sig,44+(LFSaw.ar(1/4/fib(6)).exprange(0.001,1)*1000));
        sig = GVerb.ar(sig,10)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
    };

    ~happybirthdaysong.play;
);" ],
[ 52.888145359, 'me', "thisProcess.stop;" ],
[ 111.345213104, 'me', "(
    ~happybirthdaysong.quant=2;
    ~happybirthdaysong.fadeTime=1;
    ~happybirthdaysong={
        var sig;
        var mel = [];
        var melod = [10,10,12,10,15,14,
                     10,10,12,10,17,15,
                     10,10,19,15,14,12,
                     20,20,19,15,17,15];
        var durs = ([1/4,1/4,1,1/2,1/2,1]!3++[1/4,1/4,1,1/2,1/2,8]).flat*1.5;
        var notes = [\"A\",\"#A\",\"B\",\"C\",\"C#\",\"D\",\"D#\",\"E\",\"F\",\"F#\",\"G\",\"G#\"];
        var freqs = [];
        var freq = 432;
        var factor = (2.0).pow(1.0/12.0);
        25.do{|i|
              freq = freq * factor;
              (i+\"\"+notes.at(i%notes.size)+\"\"+freq).postln;
              freqs = freqs ++ freq;
             };
        
        melod.collect({|i| mel=mel++freqs.at(i); });
        mel = Duty.kr(Dseq(durs,inf),0,Dseq(mel,inf)).lag(1/4);
        sig = SinOsc.ar(mel+SinOsc.ar(1/4/fib(6)).range(-4,4),mul:0.25);
        sig = Resonz.ar(sig,44+(LFSaw.ar(1/4/fib(6)).exprange(0.001,1)*1000));
        sig = GVerb.ar(sig,10)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
    };

    ~happybirthdaysong.play;
);" ],
[ 299.102352524, 'me', "(
    ~happybirthdaysong.quant=2;
    ~happybirthdaysong.fadeTime=1;
    ~happybirthdaysong={
        var sig;
        var mel = [];
        var melod = [10,10,12,10,15,14,
                     10,10,12,10,17,15,
                     10,10,19,15,14,12,
                     20,20,19,15,17,15];
        var durs = ([1/4,1/4,1,1/2,1/2,1]!3++[1/4,1/4,1,1/2,1/2,8]).flat*1.5;
        var notes = [\"A\",\"#A\",\"B\",\"C\",\"C#\",\"D\",\"D#\",\"E\",\"F\",\"F#\",\"G\",\"G#\"];
        var freqs = [];
        var freq = 432;
        var factor = (2.0).pow(1.0/12.0);
        25.do{|i|
              freq = freq * factor;
              (i+\"\"+notes.at(i%notes.size)+\"\"+freq).postln;
              freqs = freqs ++ freq;
             };
        
        melod.collect({|i| mel=mel++freqs.at(i); });
        mel = Duty.kr(Dseq(durs,inf),0,Dseq(mel,inf)).lag(1/4);
        sig = SinOsc.ar(mel+SinOsc.ar(1/4/fib(6)).range(-4,4),mul:0.25);
        sig = Resonz.ar(sig,44+(LFSaw.ar(1/4/fib(6)).exprange(0.001,1)*1000));
        sig = GVerb.ar(sig,10)/2+sig;
        Splay.ar(sig.flat,0.25,0.75);
    };

    ~happybirthdaysong.play;
);" ],
[ 319.872488375, 'me', "thisProcess.stop;" ],
[ 321.527062044, 'me', "(
    ~happybirthdaysong.quant=2;
    ~happybirthdaysong.fadeTime=1;
    ~happybirthdaysong={
        var sig;
        var mel = [];
        var melod = [10,10,12,10,15,14,
                     10,10,12,10,17,15,
                     10,10,19,15,14,12,
                     20,20,19,15,17,15];
        var durs = ([1/4,1/4,1,1/2,1/2,1]!3++[1/4,1/4,1,1/2,1/2,8]).flat*1.5;
        var notes = [\"A\",\"#A\",\"B\",\"C\",\"C#\",\"D\",\"D#\",\"E\",\"F\",\"F#\",\"G\",\"G#\"];
  
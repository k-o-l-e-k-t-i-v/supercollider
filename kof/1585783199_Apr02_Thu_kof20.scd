p.push();


// asus_googles_test synth ///////////////////////////////////////

(
~asus_googles_test.ar(2);
~asus_googles_test.quant=2;
~asus_googles_test={
  var sig = SinOsc.ar([1,2]);
  sig;
};
~asus_googles_test.play;
);
~asus_googles_test.stop(4);
~asus_googles_test.clear;
~asus_googles_test.pause;
~asus_googles_test.resume;

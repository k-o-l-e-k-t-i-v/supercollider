s.prepareForRecord("/tmp/render.aiff");
(
  Dialog.openPanel({ arg path;
    path.postln;
    s.record;
    h=History.new.loadCS(path,forward:true);
    h.play;
  },{
    "cancelled".postln;
  });
)  
s.stopRecording;

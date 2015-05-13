

// History recorder

(
History.stop;
History.new;
History.start;
)

// live coding starts here.. everyting recorded

"test1".postln;
"test2".postln;
"test3".postln;



// when finished coding
(
History.stop;
// History.document (optional)
// save as
Dialog.savePanel({arg path; History.saveStory(path);});

)


///// LOADING / PLAYING
(
Dialog.openPanel({arg path; h = History.loadStory(path); h.play;});
)
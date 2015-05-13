

// History recorder
// START RECORDING
(
History.stop;
History.new;
History.start;
)



/////////// live coding starts here (or in any other Document).. everyting recorded

"test1".postln;
"test2".postln;
"test3".postln;



// when finished coding
/////// SAVE IT //////////////////
(
History.stop;
// History.document (optional)
// save as
Dialog.savePanel({arg path; History.saveStory(path);});

)



///// LOADING / PLAYING /////////////////
(
Dialog.openPanel({arg path; h = History.loadStory(path); h.document; h.play;});
)
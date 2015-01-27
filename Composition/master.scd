// concept for composing at 3. 4files have to be open, every can write to his one, supercolide reload saved changes. Master task just play it.
// - 1) masterFile,
// - 2) composerTrack_A
// - 3) composerTrack_B
// - 4) composerTrack_C



//  1) masterFile - main task to play all 3 part at same time ////////////////////////////
(
~composition = {|alex,jachym,krystof|

(
    ~tc = TempoClock.default;

    Tdef(\master).stop;
    Tdef(\master,
         if(alex == True,{
         Tdef(\Track_A).fork;
         });

         if(jachym == True,{
         Tdef(\Track_B).fork;
         });

         if(krystof == True,{
         Tdef(\Track_C).fork;
         })

        );
);
};
)
//  1) masterFile - end of file //////////////////////////////////////////////////////////



// SC 3.7.0alpha win
(
~doc = Document.new("test","12345",true);
~ideDoc = ScIDEDocument.findByQUuid(~doc.quuid);
)

~doc.name;
~doc.quuid;
~doc.text;
~doc.title; // ScIDEDocument;
~doc.isEdited;
// ~doc.listener;

~ideDoc.text;
~ideDoc.quuid;
~ideDoc.getChar(2);
~ideDoc.rangeText.size; //end of document index
~ideDoc.insertText("A",4);
~ideDoc.insertText("Z",~ideDoc.rangeText.size);
~ideDoc.setChar("B",0); // replace first
~ideDoc.setChar("Z",~ideDoc.rangeText.size-1); // replace last
~ideDoc.setChar("7",~ideDoc.rangeText.size); //add to end of document




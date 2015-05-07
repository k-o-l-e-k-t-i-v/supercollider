(
~net = NetAddr("127.0.0.1", NetAddr.langPort);
~name = "Joach";

~sendMsg = ();
~sendMsg.joinKolektiv = { ~net.sendMsg('/join', ~name) };
~sendMsg.syncKolektiv = { ~net.sendMsg('/sync', ~name, Document.current.text.asString) };

~reciveMsg_join = OSCFunc({|msg, time, addr, recvPort| msg.postln; }, '/join');
~reciveMsg_sync = OSCFunc({|msg, time, addr, recvPort| msg.postln; }, '/sync');
)

~sendMsg.joinKolektiv;
~sendMsg.syncKolektiv;

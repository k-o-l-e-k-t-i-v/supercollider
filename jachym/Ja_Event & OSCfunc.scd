(
~net = NetAddr("127.0.0.1", NetAddr.langPort);
~name = "Joach";

~sendMsg = ();
~sendMsg.joinKolektiv = { ~net.sendMsg('/join', ~name) };
~sendMsg.syncKolektiv = { ~net.sendMsg('/sync', ~name, Document.current.text.asString) };

OSCdef.newMatching(\reciveMsg_join, {|msg, time, addr, recvPort| msg.postln;}, '/join', ~net);
OSCdef.newMatching(\reciveMsg_sync, {|msg, time, addr, recvPort| msg[2].postln;}, '/sync', ~net);
)

~sendMsg.joinKolektiv;
~sendMsg.syncKolektiv;

OSCdef.freeAll;

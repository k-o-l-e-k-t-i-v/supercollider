// server
(
Server.default = Server.internal = s = Server(\local, NetAddr("127.0.0.1", 57110));
s.boot;
)


//client
Server.default = Server.local = Server(\remote , NetAddr("94.112.205.204",  57110 ) );


// test
{SinOsc.ar(880)}.play;

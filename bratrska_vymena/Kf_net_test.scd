//client
(
s = Server.new(\remote , NetAddr("10.0.0.37",  57110 ) );
Server.local = Server.default = s;
)

// ctrl + .
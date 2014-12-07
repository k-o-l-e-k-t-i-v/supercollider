
thisProcess.openUDPPort(7777); // attempt to open 1121

(
o.free;

~cntr = 0;

o = OSCFunc({ arg msg, time, addr, recvPort; //[msg, time, addr, recvPort].postln; //argyments
	(

		~cntr.postln;
		~cntr = ~cntr + 1;

		//bang just every fourth
		if(~cntr% 4 ==  0){
			[12,18,13,14].wrapAt(~cntr).postln;

		}
		//function


	)

}, '/bang');

)

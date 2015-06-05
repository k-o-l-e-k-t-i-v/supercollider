// History, as it was on Fri Jun  5 14:42:11 2015.

[
[ 0, 'me', "{1000.0.rand.round(0.01).postln}.dup(100).plot // choose, round, dup, plot" ],
[ 5.397785636, 'me', "{1000.0.rand.round(0.01).postln}.dup(100).postln.sort.plot // choose etc., sort, plot" ],
[ 50.565539833, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 51.306243854, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 51.608439255, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 52.01585517, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 52.234725962, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 52.650583128, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 53.019104798, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 53.22254264, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 53.438567667, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 53.772428089, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 54.135964176, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 54.557981326, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 54.832960958, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 55.036894551, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 55.208750446, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 55.376051712, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 55.544173706, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 55.711559723, 'me', "0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose // multiples of a smallest quantize value" ],
[ 64.580047151, 'me', "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].permute(6) " ],
[ 66.199322967, 'me', "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].permute(6) " ],
[ 66.689477012, 'me', "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].permute(6) " ],
[ 66.983238903, 'me', "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].permute(6) " ],
[ 80.640691772, 'me', "dup(rand(1000.0), 5)  // picks a number, duplicates it" ],
[ 86.961317794, 'me', "dup({rand(1000.0)}, 5)  //duplicates the function of picking a number" ],
[ 93.350350031, 'me', "[rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0)]" ],
[ 94.348074906, 'me', "[rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0)]" ],
[ 94.692250112, 'me', "[rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0)]" ],
[ 95.145868208, 'me', "[rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0)]" ],
[ 426.227706649, 'me', "t=Task({\"test\".postln;1});" ],
[ 429.926752497, 'me', "t.play;" ],
[ 434.386456831, 'me', "t.play;" ],
[ 436.098079653, 'me', "t.play;" ],
[ 436.356313446, 'me', "t.play;" ],
[ 436.596862769, 'me', "t.play;" ],
[ 436.797596044, 'me', "t.play;" ],
[ 465.590838405, 'me', "t=Task({10.do{\"test\".postln;1.wait;};});" ],
[ 476.458889906, 'me', "t.play;" ],
[ 503.563834533, 'me', "(
t=Task({10.do{(1..80).choose.postln;1.wait;};});
t.play;
)" ],
[ 519.652163161, 'me', "(
t=Task({100.do{(1..80).choose.postln;1.wait;};});
t.play;
)" ],
[ 526.559319462, 'me', "(
t=Task({100.do{(1..80).choose.postln;0.1.wait;};});
t.play;
)" ],
[ 567.485638418, 'me', "(
t=Task({loop{(1..80).choose.postln;0.1.wait;}});
t.play;
)" ],
[ 606.489352571, 'me', "t=Task({loop{(1..8000).choose.postln;0.1.wait;}});" ],
[ 609.749790511, 'me', "t=Task({loop{(1..8000).choose.postln;0.1.wait;}});" ],
[ 611.172980655, 'me', "t=Task({loop{(1..8000).choose.postln;0.1.wait;}});" ],
[ 619.124965813, 'me', "t=Task({loop{(1..8000).choose.postln;0.1.wait;};});" ],
[ 638.165966118, 'me', "(
t=Task({loop{(1..8000).choose.postln; 0.1.wait;}});
t.play(quant:2);
)" ],
[ 651.62580973, 'me', "(
t=Task({loop{(1..800000).choose.postln; 0.1.wait;}});
t.play(quant:2);
)" ],
[ 656.254154768, 'me', "(
t=Task({loop{(1..800000).choose.postln; 0.01.wait;}});
t.play(quant:2);
)" ],

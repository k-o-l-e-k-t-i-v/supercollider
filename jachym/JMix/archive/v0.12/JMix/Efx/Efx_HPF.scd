SynthDef(\Efx_HPF, { |out=0, freq=440|
	ReplaceOut.ar(out, HPF.ar(In.ar(out, 2),freq))
},metadata: (
		specs: (
			freq: ControlSpec(100, 20000, \lin, 50, 1000)
					)
	)
)
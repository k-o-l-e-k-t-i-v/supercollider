Jenv {
	*new{|key, levels = #[0,1,0], times = #[1,1], curves = #[\lin], repeats = inf|
		var pbind = Pbind(
			\type, \set,
			\args, [key.asSymbol],
			\dur, 1/Server.local.options.blockSize,
			key.asSymbol, Pn(Penv(levels, times, curves), repeats)
		);
		^pbind;
	}
}

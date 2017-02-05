CtkSynthDef (\playbuffer, {arg buf, bus, dur, gate=1;
	var in, env;
	in = PlayBuf .ar(2, buf);
	//repating envelope
	env = EnvGen.ar(Env([0, 1, 1, 0, 0], [0.05, 0.9, 0.049, 0.001], \sin, 3, 0), gate, timeScale: dur, doneAction:2);
	Out.ar(bus, in * env);
	});

//with compression
CtkSynthDef (\playbuffer, {arg buf, bus, dur, gate=1;
	var in, comp, env;
	// in = PlayBuf .ar(2, buf, BufRateScale.kr(buf), loop:1);
	in = PlayBuf .ar(2, buf);
	comp = Compander.ar(in, in, 0.5, 0.3, 0.01, 0.002, 0.01);
	env = EnvGen.ar(Env([0, 1, 1, 0, 0], [0.05, 0.9, 0.049, 0.001], \sin, 3, 0), gate, timeScale: dur, doneAction:2);
	Out.ar(bus, in * env);
	});

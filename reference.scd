
(
SynthDef("different_tones",{
	arg freq, freq2; // declare an argument and give it a default value
	var out;
	out = SinOsc.ar([freq, freq2])*0.3;
	Out.ar(0,out);
}).play
)


d = [400,800];
e = d.at(0).postln;
g = d.at(1).postln;
f = Synth("different_tones", ["freq", e,"freq2", g]);


f.set("freq", 500);
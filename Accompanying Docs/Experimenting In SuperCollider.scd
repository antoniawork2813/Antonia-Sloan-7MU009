FileReader.read(thisProcess.nowExecutingPath.dirname +/+ "example2.txt");



(
{
	var phone = FileReader.readInterpret(thisProcess.nowExecutingPath.dirname +/+ "example2.txt");
	var first = phone[0].postln;
	var freq = 100 * first.choose;

	SinOsc.ar(freq, 0, 0.5) ! 2
}.play
)



(
SynthDef(\test, { | out, freq = 440, amp = 0.1, nharms = 10, pan = 0, gate = 1 |
	var audio = Blip.ar(freq, nharms, amp);
	var env = Linen.kr(gate, doneAction: Done.freeSelf);
	OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)


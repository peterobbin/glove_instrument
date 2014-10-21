






r.stop;
p.close;

{Impulse.kr(440,0,1)}.plot
Quarks.gui;




["sValue"].postln

{SinOsc.ar(res, 0, 0.7)}.play



(
SynthDef("tones",{
	arg freq = 440,freq2 = 440;
	//freq = "benderValue";
	//var r = MouseX.kr(0,0.4);
	var out;
	out = SinOsc.ar(freq, mul: SinOsc.kr([0.25,1]));
	//out = SinOsc.ar(freq + 130, mul: SinOsc.kr(1));
	Out.ar(0, out)



}).play
)





(

SerialPort.listDevices;
p = SerialPort(
    "/dev/tty.usbmodemfa131",
    baudrate: 9600,
    crtscts: true);

a = Synth("tones", ["freq",700]);
r= Routine({


	arg benderValue = 440;
    var byte, str, res, splitTest;
    99999.do{|i|
        if(p.read==10, {
            str = "";
            while({byte = p.read; byte !=13 }, {
                str= str++byte.asAscii;
            });
			splitTest = str.split($,).asInteger;
            res= str.asInteger;
			benderValue = str.asInteger;
			("test value:"+splitTest).postln;
           // ("read value:"+res).postln;
			//("omg" + benderValue).postln;
			a.set("freq",[splitTest],"freq2",splitTest);
			//Synth("tones",["freq","benderValue"]);

        });
    };
}).play;

)


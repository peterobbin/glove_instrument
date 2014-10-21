






(
SynthDef("tones",{
	arg freq = 400,freq2 = 400;
	var out;
	out = SinOsc.ar([freq,freq2], 0,1);
	Out.ar(0, out)
}).play
)
a = Synth("tones", ["freq",600,"freq 2",500]);

(

SerialPort.listDevices;
p = SerialPort(
    "/dev/tty.usbmodemfa131",
    baudrate: 9600,
    crtscts: true);
a = Synth("tones", ["freq",400,"freq2",400]);
r= Routine({

    var byte, str, res, tone1, tone2;
    99999.do{|i|
        if(p.read==10, {
            str = "";
            while({byte = p.read; byte !=13 }, {
                str= str++byte.asAscii;
            });
            res= str.split($,).asInteger;
			tone1 = res.at(0).postln;
			tone2 = res.at(1).postln;

			("test value:"+res).postln;
			("tone1:"+tone1).postln;
			("tone2:"+tone2).postln;

			a.set("freq",tone1,"freq2", tone2);

        });
    };
}).play;

)


r.stop;
p.close;
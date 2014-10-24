






(
SynthDef("tones",{
	arg freq = 400,freq2 = 400, freq3 =400, freq4 = 400;
	var out;
	var out2;
	out = SinOsc.ar([freq,freq2], 0,1);
	out2 = SinOsc.ar([freq3,freq4], 0,1);
	Out.ar(0, out);
	Out.ar(0, out2);
}).play
)
a = Synth("tones", ["freq",600,"freq2",500,"freq3",700, "freq4",700]);

(

SerialPort.listDevices;
p = SerialPort(
    "/dev/tty.usbmodemfa131",
    baudrate: 9600,
    crtscts: true);
a = Synth("tones", ["freq",400,"freq2",400,"freq3",400, "freq4",400]);
r= Routine({

    var byte, str, res, tone1, tone2, tone3, tone4;
    99999.do{|i|
        if(p.read==10, {
            str = "";
            while({byte = p.read; byte !=13 }, {
                str= str++byte.asAscii;
            });
            res= str.split($,).asInteger;
			tone1 = res.at(0).postln;
			tone2 = res.at(1).postln;
			tone3 = res.at(2).postln;
			tone4 = res.at(3).postln;

			("test value:"+res).postln;
			("tone1:"+tone1).postln;
			("tone2:"+tone2).postln;
			("tone3:"+tone3).postln;
			("tone4:"+tone4).postln;

			a.set("freq",tone4,"freq2", tone2,"freq3",tone3, "freq4",tone4);

        });
    };
}).play;

)


r.stop;
p.close;
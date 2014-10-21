void setup()
{
  Serial.begin(9600);
}

void loop()
{
 int sensor, degrees;
 sensor = analogRead(0);
 degrees = map(sensor, 768, 853, 400, 500);
 

 // Serial.print("[");
  Serial.print(degrees,DEC);
  //Serial.print(",");
 // Serial.print(sensor,DEC);
  //Serial.println("]");
  delay(100);

}

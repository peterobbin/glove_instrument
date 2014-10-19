void setup()
{
  Serial.begin(9600);
}

void loop()
{
 int sensor, degrees;
 sensor = analogRead(0);
 degrees = map(sensor, 768, 853, 0, 90);
 


  Serial.println(degrees,DEC);
  delay(100);

}

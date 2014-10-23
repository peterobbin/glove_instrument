void setup()
{
  Serial.begin(9600);
}

void loop()
{
 int sensor, sensor2, degrees;
 sensor = analogRead(0);
 sensor2 = analogRead(1);
 degrees = map(sensor, 768, 853, 400, 500);
 

 // Serial.print("[");
  Serial.print(degrees,DEC);
  Serial.print(",");
  Serial.println(sensor2,DEC);
  
  
  //Serial.println("]");
  delay(100);

}

void setup()
{
  Serial.begin(9600);
}

void loop()
{
 int sensor, sensor2, sensor3, sensor4, degrees, degrees2, degrees3, degrees4;
 sensor = analogRead(0);
 sensor2 = analogRead(1);
 sensor3 = analogRead(2);
 sensor4 = analogRead(3);
 
 degrees = map(sensor, 768, 853, 400, 500);
 degrees2 = map(sensor2, 768, 853, 600, 700);
 degrees3 = map(sensor3, 768, 853, 200, 300);
 degrees4 = map(sensor4, 768, 853, 400, 800);
 

 // Serial.print("[");
  Serial.print(degrees,DEC);
  Serial.print(",");
  Serial.print(degrees2,DEC);
  Serial.print(",");
  Serial.print(degrees3,DEC);
  Serial.print(",");
  Serial.print(degrees4,DEC);
  Serial.println();
  
  
  
  //Serial.println("]");
  delay(100);

}

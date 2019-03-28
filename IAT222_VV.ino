/*
OSEPP Sound Sensor Example

OSEPP example of measure sound input from microphone sensor.
depending on loudness, an LED brightness is changed.
Louder sounds = brighter LED. Test with music to get a strobe

*/


// if the volume is contantlyl being output will show something different? 


int micPin = A0;    // microphone sensor input
int micPin2 = A4; 
int ledPin = 13;      // select the pin for the LED
float micValue = 0;  // variable to store the value coming from the mic sensor
float micValue2 = 0; 

void setup() {
  Serial.begin(9600);
  //delay(100); 
}

void loop() {
  // read the value from the sensor:
  micValue = analogRead(micPin);  
  micValue = constrain(micValue, 0, 1000); //set sound detect clamp 0-100  

//  micValue2= analogRead(micPin2); 
//  micValue2 = constrain(micValue2,0,1000);  
  // turn the ledPin on
  //int ledbrightness = map(micValue, 0, 100, 0, 255);


//  for (int thisSensor = 0; thisSensor < 2; thisSensor++) {
//    int sensorValue = analogRead(thisSensor) / 4;
//    Serial.print(sensorValue);
//    // if you're on the last sensor value, end with a println()
//    // otherwise, print a comma
//    if (thisSensor == 1) {
//    Serial.println();
//  } else {
//    Serial.print(",");
//      }
//  }


  
  //Serial.print("");
  Serial.println(micValue);
//  Serial.print(","); 
//  Serial.print("Second one: ");
  //Serial.println(micValue2);
  //analogWrite(ledPin, ledbrightness);  
  delay(50);
           
}

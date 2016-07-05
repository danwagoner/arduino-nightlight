/*
 * Night Light
 *
 * A basic Arduino example that Fades in an LED if the ambient light
 * (measured by a photocell) in the room goes below a certain value.
 * If the ambient light in the room goes above that value, the LED
 * fades out. Connect the LED to pin 11 (PWM) with necessary reisitor
 * and a photocell to analog pin 2 with 5v pulldown.
 * 
 * Dan Wagoner
 * http://www.nerdybynature.com
*/


int ledPin = 11;                                  // LED connected to digital pin 11
int pcellPin = 2;                                 // Photocell connected to analog pin 2
int pcellVal = 0;                                 // define photocell variable
int ledLit = 0;                                   // define boolean

void setup(){
  pinMode(ledPin, OUTPUT);                        // sets the digital pin as output
  pinMode(pcellVal, INPUT);                       // sets the analog pin as input
}

void loop(){
pcellVal = analogRead(pcellPin);                  // get value from photocell

// Serial.begin(9600);                            // print values to serial for troubleshooting
// Serial.println(pcellVal);

if (pcellVal < 100 and ledLit == 0){              // check if ambient lights are off and LED not lit
    fadeLed(1);}                                  // if so, turn the LED on                     
else if (pcellVal > 100 and ledLit == 1){         // check if ambient lights are on and LED lit
    fadeLed(0);}                                  // if so, turn the LED off
}

void fadeLed(int x){                              // fade function
if (x == 1){                                      // fade LED in
   for (int i=0; i <= 255; i++){
      analogWrite(ledPin, i);
      delay(20);}
   ledLit = 1;}                                   // LED status = ON 
else{                                             // fade LED out
   for (int i=254; i >= 0; i--){
      analogWrite(ledPin, i);
      delay(10);}
   ledLit = 0;}                                   // LED status = OFF
}

#include "Keyboard.h"

const byte ketchupButtonPin = 2;
const byte mayoButtonPin = 3;

const byte ketchupLedPin =  12;
const byte mayoLedPin =  13;

void setup() {
  Serial.begin(9600);
  
  pinMode(ketchupLedPin, OUTPUT);
  pinMode(mayoLedPin, OUTPUT);
  
  pinMode(ketchupButtonPin, INPUT_PULLUP);
  pinMode(mayoButtonPin, INPUT_PULLUP);
}

void loop() {
  if (digitalRead(ketchupButtonPin) == LOW) {
    digitalWrite(ketchupLedPin, HIGH);
    Keyboard.write('r'); 
    delay(5000);
    Keyboard.write('b'); 
    digitalWrite(ketchupLedPin, LOW);
  }
  if (digitalRead(mayoButtonPin) == LOW) {
    digitalWrite(mayoLedPin, HIGH);
    Keyboard.write('y'); 
    delay(5000);
    Keyboard.write('b'); 
    digitalWrite(mayoLedPin, LOW);
  }
}

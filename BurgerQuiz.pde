/**
 * Burger Quiz
 * 
 * The famous TV game show :)
 *
 */


/* @pjs font="horseshoeslemonade.ttf"; */

import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer generique;
AudioPlayer buzz;

PShape ketchup; 
PShape mayo;    
PShape burgerDeLaMort; 
PShape nuggets; 
PShape seloupoivre; 
PShape addition; 
PShape menus; 
byte ketchupMiams = 0;
byte mayoMiams = 0;

Serial myPort;

boolean drawNuggets = false;
boolean drawSelOuPoivre = false;
boolean drawAddition = false;
boolean drawMenus = false;
boolean blackBackground = false;
boolean yellowBackground = false;
boolean redBackground = false;

int c;

void setup() {
  size(displayWidth, displayHeight);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  ketchup = loadShape("ketchup.svg");  // Load the image into the program
  mayo = loadShape("mayo.svg");  // Load the image into the program
  textFont(createFont("Horseshoes and Lemonade",32));
  textSize(100);
  textAlign(CENTER);
  background(0, 0, 0);
  
  burgerDeLaMort = loadShape("burger.svg");
  nuggets = loadShape("nuggets.svg");
  seloupoivre = loadShape("seloupoivre.svg");
  addition = loadShape("addition.svg");
  menus = loadShape("menus.svg");
  
  String portName = Serial.list()[7];
  print(Serial.list());
  myPort = new Serial(this, portName, 9600);
  
  minim = new Minim(this);
  
  generique = minim.loadFile("generique.mov");
  buzz = minim.loadFile("buzz.mp3");
}

void draw() {
  background(0);
  
  if ( myPort.available() > 0) {
    c = myPort.read();
    switch(c) {
      case 0:
        resetBooleans();
        blackBackground = true;
        buzz.play();
        buzz.rewind();
        break;
      case 1: 
        resetBooleans();
        yellowBackground = true;
        buzz.play();
        buzz.rewind();
        break;
      case 2: 
        resetBooleans();
        redBackground = true;
        buzz.play();
        buzz.rewind();
        break;
    }
  }
  
  if(yellowBackground)
    background(237, 212, 0);
  
  if(redBackground)
    background(204, 0, 0);
  
  if(blackBackground)
    background(0);
  
  if(!blackBackground && !yellowBackground && !redBackground) {
    // Displays the image at its actual size at point (0,0)
    shape(ketchup, width/8, 50);
    shape(mayo, width/2+width/8, 50);
    fill(52, 101, 164); 
    
    text(ketchupMiams + " miams", width/4, 720);
    text(mayoMiams + " miams", 3*width/4, 720);
  }
  if(ketchupMiams == 25 || mayoMiams == 25) {
    background(0);
    shape(burgerDeLaMort, width/4, height/12);
  }
  if(drawNuggets) {
    background(0);
    shape(nuggets, width/4, height/4);
  }
  if(drawSelOuPoivre) {
    background(0);
    shape(seloupoivre, width/4, height/4);
  }
  if(drawAddition) {
    background(0);
    shape(addition, width/4, height/4);
  }
  if(drawMenus) {
    background(0);
    shape(menus, width/4, height/4);
  }
  
}

void keyPressed() {
  if (key == 'b' || c == 0) {
    resetBooleans();
    blackBackground = true;
  }
  
  if (key == 'y' || c == 1) {
    resetBooleans();
    yellowBackground = true;
  }
    
  if (key == 'r' || c == 2){
    resetBooleans();
    redBackground = true;
  }
  
  if (key == 'k') {
    if(ketchupMiams < 25)
      ketchupMiams ++;
      resetBooleans();
  }
  if (key == 'j') {
    if(ketchupMiams > 0)
      ketchupMiams --;
      resetBooleans();
  }
  if (key == 'm') {
    if(mayoMiams < 25)
      mayoMiams ++;
      resetBooleans();
  }
  if (key == 'l') {
    if(mayoMiams > 0)
      mayoMiams --;
      resetBooleans();
  }
  if (key == 'n') {
      drawNuggets = true;
  }
  
  if (key == 's') {
      drawSelOuPoivre = true;
  }
  
  if (key == 'a') {
      drawAddition = true;
  }
  
  if (key == 'M') {
      drawMenus = true;
  }
  
  if (key == 'R') {
      resetBooleans();
  }
  
  if (key == 'g') {
    generique.play();
  }
}

void resetBooleans() {
  drawNuggets = false;
  drawSelOuPoivre = false;
  drawAddition = false;
  drawMenus = false;
  yellowBackground = false;
  redBackground = false;
  blackBackground = false;
}

boolean sketchFullScreen() {
  return true;
}

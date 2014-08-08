/**
 * Burger Quiz
 * 
 * The famous TV game show :)
 *
 */


/* @pjs font="horseshoeslemonade.ttf"; */

PShape ketchup; // svg
PShape mayo;    // svg
PShape burgerDeLaMort; // svg
PShape nuggets; // svg
PShape seloupoivre; // svg
PShape addition; // svg
PShape menus; // svg
byte ketchupMiams = 0;
byte mayoMiams = 0;

boolean drawNuggets = false;
boolean drawSelOuPoivre = false;
boolean drawAddition = false;
boolean drawMenus = false;

void setup() {
  size(1280, 800);
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
  
}

void draw() {
  background(0, 0, 0);
  
  // Displays the image at its actual size at point (0,0)
  shape(ketchup, width/8, 50);
  shape(mayo, width/2+width/8, 50);
  fill(52, 101, 164); 
  
  text(ketchupMiams + " miams", width/4, 720);
  text(mayoMiams + " miams", 3*width/4, 720);
  if(ketchupMiams == 25 || mayoMiams == 25) {
    background(0, 0, 0);
    shape(burgerDeLaMort, 300, 50);
  }
  if(drawNuggets) {
    background(0, 0, 0);
    shape(nuggets, 140, 200);
  }
  if(drawSelOuPoivre) {
    background(0, 0, 0);
    shape(seloupoivre, 190, 170);
  }
  if(drawAddition) {
    background(0, 0, 0);
    shape(addition, 160, 260);
  }
  if(drawMenus) {
    background(0, 0, 0);
    shape(menus, 140, 220);
  }
}

void keyPressed() {
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
  
  if (key == 'r') {
      resetBooleans();
  }
}

void resetBooleans() {
  drawNuggets = false;
  drawSelOuPoivre = false;
  drawAddition = false;
  drawMenus = false;
}

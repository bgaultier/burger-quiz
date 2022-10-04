var ketchup; 
var mayo;    
var burgerDeLaMort; 
var nuggets; 
var seloupoivre; 
var addition; 
var menus; 
var ketchupMiams = 0;
var mayoMiams = 0;

var drawNuggets = false;
var drawSelOuPoivre = false;
var drawAddition = false;
var drawMenus = false;
var blackBackground = false;
var yellowBackground = false;
var redBackground = false;

var c;

var horseshoeslemonade;

function preload() {
  horseshoeslemonade = loadFont('assets/horseshoeslemonade.ttf');
  
  ketchup = loadImage("assets/ketchup.svg");  // Load the image into the program
  mayo = loadImage("assets/mayo.svg");  // Load the image into the program
  
  burgerDeLaMort = loadImage("assets/burger.svg");
  nuggets = loadImage("assets/nuggets.svg");
  seloupoivre = loadImage("assets/seloupoivre.svg");
  addition = loadImage("assets/addition.svg");
  menus = loadImage("assets/menus.svg");
}

function setup() {
  createCanvas(windowWidth,windowHeight);
  
  textFont(horseshoeslemonade);
  textSize(100);
  textAlign(CENTER);
  background(0);
}

function draw() {
  background(0);
  
  if(yellowBackground)
    background(237, 212, 0);
  
  if(redBackground)
    background(204, 0, 0);
  
  if(blackBackground)
    background(0);
  
  if(!blackBackground && !yellowBackground && !redBackground) {
    // Displays the image at its actual size at point (0,0)
    image(ketchup, windowWidth/4-ketchup.width/2, windowHeight/2.5-ketchup.height/2);
    image(mayo, windowWidth/4*3-mayo.width/2, windowHeight/2.5-mayo.height/2);
    fill(52, 101, 164); 
    
    text(ketchupMiams + " miams", width/4, 720);
    text(mayoMiams + " miams", 3*width/4, 720);
  }
  if(ketchupMiams == 25 || mayoMiams == 25) {
    background(0);
    image(burgerDeLaMort, windowWidth/2-burgerDeLaMort.width/2, windowHeight/2-burgerDeLaMort.height/2);
  }
  if(drawNuggets) {
    background(0);
    image(nuggets, windowWidth/2-nuggets.width/2, windowHeight/2-nuggets.height/2);
  }
  if(drawSelOuPoivre) {
    background(0);
    image(seloupoivre, windowWidth/2-seloupoivre.width/2, windowHeight/2-seloupoivre.height/2);
  }
  if(drawAddition) {
    background(0);
    image(addition, windowWidth/2-addition.width/2, windowHeight/2-addition.height/2);
  }
  if(drawMenus) {
    background(0);
    image(menus, windowWidth/2-menus.width/2, windowHeight/2-menus.height/2);
  }
}

function keyTyped() {
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
}

function resetBooleans() {
  drawNuggets = false;
  drawSelOuPoivre = false;
  drawAddition = false;
  drawMenus = false;
  yellowBackground = false;
  redBackground = false;
  blackBackground = false;
}
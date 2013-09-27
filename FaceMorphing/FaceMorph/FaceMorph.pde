// Face Morphing Demo
// Based on: https://ccrma.stanford.edu/~jacobliu/368Report/
// Daniel Shiffman

// Two images
PImage a;
PImage b;

// A Morphing object
Morpher morph;

// How much to morph, 0 is image A, 1 is image B, everything else in between
float amt =  0;
// Morph bar position
float x = 100; 

void setup() {
  size(960, 800, P2D);

  // Load the images
  a = loadImage("pitt.jpg");
  b = loadImage("jolie.jpg");

  // Create the morphing object
  morph = new Morpher(a, b);
}

void draw() {


  background(0);

  pushMatrix();

  // Show Image A and its triangles
  morph.displayImageA();
  morph.displayTrianglesA();

  // Show Image B and its triangles
  translate(a.width, 0);
  morph.displayImageB();


  translate(-a.width, a.height);

  // Update the amount according to mouse position when pressed
  if (mousePressed && mouseY > a.height) {
    x = constrain(mouseX, 100, width-100);
    amt = map(x, 100, width-100, 0, 1);
  }

  // Morph an amount between 0 and 1 (0 being all of A, 1 being all of B)
  morph.drawMorph(amt);


  popMatrix();

  // Have you clicked on the images?
  if (va != null) {
    fill(255, 0, 0);
    ellipse(va.x, va.y, 8, 8);
  }
  if (vb != null) {
    fill(255, 0, 0);
    ellipse(vb.x, vb.y, 8, 8);
  }



  // Draw bar at bottom
  stroke(255);
  line(100, height-50, width-100, height-50);
  stroke(255);
  line(x, height-75, x, height-25);


  // Some text instructions
  fill(255);
  textSize(20);
  String s = "Click on left image to set a point then click on right image to set corresponding point.";
  s += " For example, click on right eye in left image then right eye in right image.  Set as many corresponding points as possible.";
  s += "\n\n 's' to save points, 'l' to load points";
  text(s, a.width+10, a.height+20, a.width-20, a.height-10);
}

// Save or load points based on key presses
void keyPressed() {
  if (key == 's') {
    morph.savePoints();
  } 
  else if (key == 'l') {
    morph.loadPoints();
  }
}

// Variables to keep track of mouse interaction
int counter = 0;
PVector va;
PVector vb;

void mousePressed() {
  
  
  // If we clicked on an image
  if (mouseY < a.height) {
    // Point on image A first
    if (counter == 0) {
      va = new PVector(mouseX, mouseY);
    } 
    // Corresponding point on image B
    else if (counter == 1) {
      PVector vb = new PVector(mouseX-a.width, mouseY);
      morph.addPair(va, vb);
    }
    // Increment click counter
    counter++;
    if (counter == 2) {
      // Start over
      counter = 0;
      va = null;
      vb = null;
    }
  }
}


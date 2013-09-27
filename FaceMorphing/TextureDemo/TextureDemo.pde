// Face Morphing Demo
// Based on: https://ccrma.stanford.edu/~jacobliu/368Report/
// Daniel Shiffman

// Two images
PImage pittimg;
PImage jolieimg;

// Triangle on each image, plus the morphed one
Triangle pitt;
Triangle jolie;
Triangle morph;



// How much to morph, 0 is image A, 1 is image B, everything else in between
float amt =  0;
// Morph bar position
float x = 100; 

void setup() {
  size(960, 800, P2D);

  // Load the images
  pittimg = loadImage("pitt.jpg");
  jolieimg = loadImage("jolie.jpg");

  // Make up some triangles
  pitt = new Triangle(177, 172, 260, 167, 217, 256);
  jolie = new Triangle(188, 121, 257, 115, 226, 189);
  morph = new Triangle(0, 0, 0, 0, 0, 0);
}

void draw() {

  noTint();

  background(0);
  slider();
  textureMode(IMAGE);
  pushMatrix();
  pitt();
  jolie();
  translate(-pittimg.width, pittimg.height);

  // Morph an amount between 0 and 1 (0 being all of A, 1 being all of B)
  // This "morphs" the vertices
  morph.a = PVector.lerp(pitt.a, jolie.a, amt);
  morph.b = PVector.lerp(pitt.b, jolie.b, amt);
  morph.c = PVector.lerp(pitt.c, jolie.c, amt);


  // Draw the triangle with jolie's face but morphed points
  beginShape();
  texture(jolieimg);
  tint(255, amt*255);
  vertex(morph.a.x, morph.a.y, jolie.a.x, jolie.a.y);
  vertex(morph.b.x, morph.b.y, jolie.b.x, jolie.b.y);
  vertex(morph.c.x, morph.c.y, jolie.c.x, jolie.c.y);
  endShape();
  
  // Blend on top of that the triangle with pitt's face but morphed points
  beginShape();
  texture(pittimg);
  tint(255, 255-amt*255);
  vertex(morph.a.x, morph.a.y, pitt.a.x, pitt.a.y);
  vertex(morph.b.x, morph.b.y, pitt.b.x, pitt.b.y);
  vertex(morph.c.x, morph.c.y, pitt.c.x, pitt.c.y);
  endShape();
  
  // Triangle edges
  beginShape();
  vertex(morph.a.x, morph.a.y);
  vertex(morph.b.x, morph.b.y);
  vertex(morph.c.x, morph.c.y);
  endShape(CLOSE);

  popMatrix();

  // Draw bar at bottom
  stroke(255);
  line(100, height-50, width-100, height-50);
  stroke(255);
  line(x, height-75, x, height-25);
}

void pitt() {
  // Show Image A and its triangles
  image(pittimg, 0, 0);
  beginShape();
  texture(pittimg);
  vertex(pitt.a.x, pitt.a.y, pitt.a.x, pitt.a.y);
  vertex(pitt.b.x, pitt.b.y, pitt.b.x, pitt.b.y);
  vertex(pitt.c.x, pitt.c.y, pitt.c.x, pitt.c.y);
  endShape();

  beginShape();
  noFill();
  stroke(255);
  vertex(pitt.a.x, pitt.a.y);
  vertex(pitt.b.x, pitt.b.y);
  vertex(pitt.c.x, pitt.c.y);
  endShape(CLOSE);
}

void jolie() {
  // Show Image B and its triangles
  translate(pittimg.width, 0);
  image(jolieimg, 0, 0);

  beginShape();
  texture(jolieimg);
  vertex(jolie.a.x, jolie.a.y, jolie.a.x, jolie.a.y);
  vertex(jolie.b.x, jolie.b.y, jolie.b.x, jolie.b.y);
  vertex(jolie.c.x, jolie.c.y, jolie.c.x, jolie.c.y);
  endShape();

  beginShape();
  vertex(jolie.a.x, jolie.a.y);
  vertex(jolie.b.x, jolie.b.y);
  vertex(jolie.c.x, jolie.c.y);
  endShape(CLOSE);
}

void slider() {
  // Update the amount according to mouse position when pressed
  if (mousePressed && mouseY > pittimg.height) {
    x = constrain(mouseX, 100, width-100);
    amt = map(x, 100, width-100, 0, 1);
  }
}


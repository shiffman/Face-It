PImage a;
PImage b;
Morpher morph;

void setup() {
  size(960, 800, P2D);
  a = loadImage("pitt.jpg");
  b = loadImage("jolie.jpg");
  morph = new Morpher(a, b);
}

void draw() {

  float x = constrain(mouseX, 100, width-100);

  background(0);
  pushMatrix();
  morph.displayImageA();
  morph.displayTrianglesA();
  translate(a.width, 0);
  morph.displayImageB();
  morph.displayTrianglesB();  
  translate(-a.width, a.height);
  float amt = map(x, 100, width-100, 0, 1);
  morph.drawMorph(amt);
  popMatrix();

  stroke(255);
  line(100, height-50, width-100, height-50);
  stroke(255);
  line(x, height-75, x, height-25);
  
  fill(255);
  textSize(20);
  String s = "Click on left image to set a point then click on right image to set corresponding point.";
  s += " For example, click on right eye in left image then right eye in right image.  Set as many corresponding points as possible.";
  s += "\n\n 's' to save points, 'l' to load points";
  text(s,a.width+10,a.height+20,a.width-20,a.height-10);
}

void keyPressed() {
  if (key == 's') {
    morph.savePoints(); 
  } else if (key == 'l') {
    morph.loadPoints();
  }
}

int counter = 0;
PVector va;
PVector vb;

void mousePressed() {
  if (counter == 0) va = new PVector(mouseX,mouseY);
  else if (counter == 1) {
    PVector vb = new PVector(mouseX-a.width,mouseY);
    morph.addPair(va,vb); 
  }
  counter++;
  if (counter == 2) {
    counter = 0;
  }
}






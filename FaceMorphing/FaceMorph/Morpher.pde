// Face Morphing Demo
// Based on: https://ccrma.stanford.edu/~jacobliu/368Report/
// Daniel Shiffman

// The triangulate package is in the "code" folder and helps create the polygons
// It's a modified version of: http://wiki.processing.org/w/Triangulation

import triangulate.*;

class Morpher {


  // A list of edges (each one is a pair of PVectors, one on each image)
  ArrayList<Pair> pairs = new ArrayList<Pair>();
  // A list of triangles (each one is a pair of Triangles, one on each image)
  ArrayList<TrianglePair> tiles;

  // The two images
  PImage imgA;
  PImage imgB;

  Morpher(PImage imgA_, PImage imgB_) {
    imgA = imgA_;
    imgB = imgB_;

    // Start off with some boring default points along the edges of the image
    pairs.add(new Pair(0, 0));
    pairs.add(new Pair(imgA.width/2, 0));
    pairs.add(new Pair(imgA.width, 0));
    pairs.add(new Pair(0, imgA.height/2));
    pairs.add(new Pair(imgA.width, imgA.height/2));
    pairs.add(new Pair(0, imgA.height));
    pairs.add(new Pair(imgA.width/2, imgA.height));
    pairs.add(new Pair(imgA.width, imgA.height));
    makeTriangles();
  }

  // Add a pair of points, one on each image
  void addPair(PVector a, PVector b) {
    pairs.add(new Pair(a.get(), b.get()));
    makeTriangles();
  }

  // Create an array of triangle pairs
  void makeTriangles() {
    tiles = Triangulate.triangulatePairs(pairs);
  }

  // Here's how we draw an image
  void displayImageA() {
    // Look at every triangle
    for (TrianglePair t : tiles) {
      noTint();
      noStroke();
      noFill();
      textureMode(IMAGE);
      // Draw as a shape with three points and textured from the image
      beginShape();
      texture(imgA);
      // This is awkard, but getting point "a" from each point of the triangle
      PVector a = t.p1.a;
      PVector b = t.p2.a;
      PVector c = t.p3.a;
      vertex(a.x, a.y, a.x, a.y);
      vertex(b.x, b.y, b.x, b.y);
      vertex(c.x, c.y, c.x, c.y);
      endShape();
    }
  }

  // Same method for drawing image B
  void displayImageB() {
    for (TrianglePair t : tiles) {
      noTint();
      noStroke();
      noFill();
      textureMode(IMAGE);
      beginShape();
      texture(imgB);
      PVector a = t.p1.b;
      PVector b = t.p2.b;
      PVector c = t.p3.b;
      vertex(a.x, a.y, a.x, a.y);
      vertex(b.x, b.y, b.x, b.y);
      vertex(c.x, c.y, c.x, c.y);
      endShape();
    }
  }


  // In case we want to see the triangles themselves
  void displayTrianglesA() {
    for (TrianglePair t : tiles) {
      stroke(255);
      strokeWeight(1);
      noFill();
      beginShape();
      PVector a = t.p1.a;
      PVector b = t.p2.a;
      PVector c = t.p3.a;
      vertex(a.x, a.y);
      vertex(b.x, b.y);
      vertex(c.x, c.y);
      endShape(CLOSE);
    }
  }

  void displayTrianglesB() {
    for (TrianglePair t : tiles) {
      stroke(255);
      strokeWeight(1);
      noFill();
      beginShape();
      PVector a = t.p1.b;
      PVector b = t.p2.b;
      PVector c = t.p3.b;
      vertex(a.x, a.y);
      vertex(b.x, b.y);
      vertex(c.x, c.y);
      endShape(CLOSE);
    }
  }


  // Ok here is hte harder one, we're going to display the morphed image
  void drawMorph(float amt) {

    // For every triangle
    for (int i = 0; i < tiles.size(); i++) {

      // Let's get the pair
      TrianglePair tp = tiles.get(i);
      // We make a new triangle which interpolates 
      Triangle t = tp.mix(amt);

      // Draw the first image
      tint(255);
      // stroke(255); // show triangles
      noStroke();
      noFill();
      textureMode(IMAGE);
      beginShape();
      texture(imgA);
      // Use morphed triangle with corresponding texture points on original triangle
      vertex(t.p1.x, t.p1.y, tp.p1.a.x, tp.p1.a.y);
      vertex(t.p2.x, t.p2.y, tp.p2.a.x, tp.p2.a.y);
      vertex(t.p3.x, t.p3.y, tp.p3.a.x, tp.p3.a.y);
      endShape();

      // Draw the second image blended with first
      noStroke();
      noFill();
      tint(255, amt*255);
      //tint(255,255); // Try showing ImageB always
      //stroke(255);   // Try showing show triangles
      textureMode(IMAGE);
      beginShape();
      texture(imgB);
      // Use morphed triangle with corresponding texture points on original triangle
      vertex(t.p1.x, t.p1.y, tp.p1.b.x, tp.p1.b.y);
      vertex(t.p2.x, t.p2.y, tp.p2.b.x, tp.p2.b.y);
      vertex(t.p3.x, t.p3.y, tp.p3.b.x, tp.p3.b.y);
      endShape();
    }
  }


  void savePoints() {
    PrintWriter pw = createWriter("data/points.txt");
    for (Pair p : pairs) {
      String s = p.a.x + "," + p.a.y + "," + p.b.x + "," + p.b.y;
      pw.println(s);
    } 
    pw.flush();
    pw.close();
  }

  void loadPoints() {
    pairs.clear();
    String[] lines = loadStrings("data/points.txt");
    for (int i = 0; i < lines.length; i++) {
      float[] vals = float(split(lines[i], ","));
      addPair(new PVector(vals[0], vals[1]), new PVector(vals[2], vals[3]));
    }
  }
}


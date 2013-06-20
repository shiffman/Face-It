
import triangulate.Pair;
import triangulate.Triangle;
import triangulate.TrianglePair;
import triangulate.Triangulate;


class Morpher {

  ArrayList<Pair> pairs = new ArrayList<Pair>();
  ArrayList<TrianglePair> tiles;

  PImage imgA;
  PImage imgB;

  Morpher(PImage imgA_, PImage imgB_) {
    imgA = imgA_;
    imgB = imgB_;

    // Image boundary
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

  void addPair(PVector a, PVector b) {
    if (a != null && b != null)  pairs.add(new Pair(a.get(), b.get()));
    makeTriangles();
  }

  void makeTriangles() {
    tiles = Triangulate.triangulatePairs(pairs);
  }

  void displayImageA() {
    for (TrianglePair t : tiles) {
      noTint();
      noStroke();
      noFill();
      textureMode(IMAGE);
      beginShape();
      texture(imgA);
      PVector a = t.p1.a;
      PVector b = t.p2.a;
      PVector c = t.p3.a;
      vertex(a.x, a.y, a.x, a.y);
      vertex(b.x, b.y, b.x, b.y);
      vertex(c.x, c.y, c.x, c.y);
      endShape();
    }
  }

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


  void drawMorph(float amt) {

    for (int i = 0; i < tiles.size(); i++) {

      TrianglePair tp = tiles.get(i);
      Triangle t = tp.mix(amt);

      tint(255);
      noStroke();
      noFill();
      textureMode(IMAGE);
      beginShape();
      texture(imgA);
      vertex(t.p1.x, t.p1.y, tp.p1.a.x, tp.p1.a.y);
      vertex(t.p2.x, t.p2.y, tp.p2.a.x, tp.p2.a.y);
      vertex(t.p3.x, t.p3.y, tp.p3.a.x, tp.p3.a.y);
      endShape();

      tint(255, amt*255);
      noStroke();
      noFill();
      textureMode(IMAGE);
      beginShape();
      texture(imgB);
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
      float[] vals = float(split(lines[i],","));
      addPair(new PVector(vals[0], vals[1]), new PVector(vals[2], vals[3]));
    }
  }
}


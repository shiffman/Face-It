

ArrayList<PVector> points = new ArrayList<PVector>();

import toxi.geom.*;
import toxi.geom.mesh2d.*;

import toxi.util.*;
import toxi.util.datatypes.*;

import toxi.processing.*;

import java.util.*;


ToxiclibsSupport gfx;
Voronoi voronoi = new Voronoi();

List<Triangle2D> tris;

void setup() {
  size(640, 480, P3D);


  gfx = new ToxiclibsSupport(this);

  Table t = loadTable("positions.csv", "header");
  for (TableRow row : t.rows()) {
    PVector v = new PVector(row.getFloat("x"), row.getFloat("y")); 
    points.add(v);
    voronoi.addPoint(new Vec2D(v.x, v.y));
  }

  tris = voronoi.getTriangles();

}

void draw() {  
  background(0);
  stroke(255);
  fill(255);
  for (PVector v : points) {
    //ellipse(v.x, v.y, 4, 4);
  } 

  //mesh.display();

  for (Polygon2D poly : voronoi.getRegions()) {
    //gfx.polygon2D(poly);
  }

  stroke(0, 0, 255, 50);
  beginShape(TRIANGLES);
  for (int i = tris.size()-1; i >= 0; i--) {
    Triangle2D t = tris.get(i);
    if (t.containsPoint(new Vec2D(mouseX, mouseY))) {
      fill(255, 0, 0, 50); 
      if (mousePressed) {
        tris.remove(i);
      }
    } 
    else {
      fill(0, 0, 255, 50);
    }

    gfx.triangle(t, true);
  }
  endShape();

  fill(255, 0, 255);
  noStroke();
  for (Vec2D c : voronoi.getSites()) {
    ellipse(c.x, c.y, 5, 5);
  }
}

void keyPressed() {
  saveTriangles();
}


void saveTriangles() {


  PrintWriter output = createWriter("triangles.csv"); 
  output.println("ax,ay,bx,by,cx,cy");
  for (Triangle2D t : tris) {
    output.println(t.a.x+","+t.a.y+","+t.b.x+","+t.b.y+","+t.c.x+","+t.c.y+",");
  }
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
}


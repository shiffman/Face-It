
ArrayList<Triangle> triangles;
ArrayList<PVector> points;

void setup() {
  size(640, 480);

  triangles = new ArrayList<Triangle>();
  points = new ArrayList<PVector>();

  Table table = loadTable("positions.csv", "header");
  for (TableRow row : table.rows()) {
    PVector v = new PVector(row.getFloat("x"), row.getFloat("y")); 
    points.add(v);
  }

  table = loadTable("triangles.csv", "header");
  for (TableRow row : table.rows()) {
    Triangle t = new Triangle();
    t.a = new PVector(row.getFloat("ax"), row.getFloat("ay")); 
    t.b = new PVector(row.getFloat("bx"), row.getFloat("by")); 
    t.c = new PVector(row.getFloat("cx"), row.getFloat("cy")); 
    triangles.add(t);
  }

  PrintWriter output = createWriter("matches.csv"); 
  output.println("p,t,abc");

  for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);
    for (int j = 0; j < triangles.size(); j++) {
      Triangle t = triangles.get(j);
      if (equals(p, t.a)) {
        //println("Point " + i + " is a of triangle " + j);
        output.println(i+","+j+",a");
      }
      if (equals(p, t.b)) {
        //println("Point " + i + " is b of triangle " + j);
        output.println(i+","+j+",b");

      }
      if (equals(p, t.c)) {
        //println("Point " + i + " is c of triangle " + j);
        output.println(i+","+j+",c");
      }
    }
  }
  
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
}

boolean equals(PVector a, PVector b) {
  if (a.x == b.x && a.y == b.y) {
    return true;
  }
  return false;
}

void draw() {
}



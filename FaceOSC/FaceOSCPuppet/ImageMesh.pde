PVector[] meshPoints2;
Triangle[] triangles2;

void initMesh2() {
  // initialize meshPoints array with PVectors
  meshPoints2 = new PVector[66];
  Table table = loadTable("obama.csv", "header");
  int count = 0;
  for (TableRow row : table.rows()) {
    meshPoints2[count] = new PVector(row.getFloat("x"), row.getFloat("y"));
    count++;
  }

  triangles2 = new Triangle[108];
  for (int i = 0; i < triangles2.length; i++) {
    triangles2[i] = new Triangle();
  }

  table = loadTable("matches.csv", "header");
  for (TableRow row : table.rows()) {
    int pi = row.getInt("p");
    int ti = row.getInt("t");
    String s = row.getString("abc");

    Triangle t = triangles2[ti];
    PVector p = meshPoints2[pi];
    if (s.equals("a")) t.a = p;
    if (s.equals("b")) t.b = p;
    if (s.equals("c")) t.c = p;
  }
}



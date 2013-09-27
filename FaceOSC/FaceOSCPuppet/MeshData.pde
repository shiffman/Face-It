PVector[] meshPoints;
Triangle[] triangles;

void initMesh() {
  // initialize meshPoints array with PVectors
  meshPoints = new PVector[66];
  for (int i = 0; i < meshPoints.length; i++) {
    meshPoints[i] = new PVector();
  }
  
  triangles = new Triangle[108];
  for (int i = 0; i < triangles.length; i++) {
    triangles[i] = new Triangle();
  }
  
  
  Table table = loadTable("matches.csv","header");
  for (TableRow row : table.rows()) {
    int pi = row.getInt("p");
    int ti = row.getInt("t");
    String s = row.getString("abc");
    
    Triangle t = triangles[ti];
    PVector p = meshPoints[pi];
    if (s.equals("a")) t.a = p;
    if (s.equals("b")) t.b = p;
    if (s.equals("c")) t.c = p;
  }
}

// this method was generated programmatically. It's fugly.
public void loadMesh(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float x5, float y5, float x6, float y6, float x7, float y7, float x8, float y8, float x9, float y9, float x10, float y10, float x11, float y11, float x12, float y12, float x13, float y13, float x14, float y14, float x15, float y15, float x16, float y16, float x17, float y17, float x18, float y18, float x19, float y19, float x20, float y20, float x21, float y21, float x22, float y22, float x23, float y23, float x24, float y24, float x25, float y25, float x26, float y26, float x27, float y27, float x28, float y28, float x29, float y29, float x30, float y30, float x31, float y31, float x32, float y32, float x33, float y33, float x34, float y34, float x35, float y35, float x36, float y36, float x37, float y37, float x38, float y38, float x39, float y39, float x40, float y40, float x41, float y41, float x42, float y42, float x43, float y43, float x44, float y44, float x45, float y45, float x46, float y46, float x47, float y47, float x48, float y48, float x49, float y49, float x50, float y50, float x51, float y51, float x52, float y52, float x53, float y53, float x54, float y54, float x55, float y55, float x56, float y56, float x57, float y57, float x58, float y58, float x59, float y59, float x60, float y60, float x61, float y61, float x62, float y62, float x63, float y63, float x64, float y64, float x65, float y65) {
  //println("loading mesh...");  

  meshPoints[0].x = x0; 
  meshPoints[0].y = y0; 
  meshPoints[1].x = x1; 
  meshPoints[1].y = y1;
  meshPoints[2].x = x2; 
  meshPoints[2].y = y2;
  meshPoints[3].x = x3; 
  meshPoints[3].y = y3;
  meshPoints[4].x = x4; 
  meshPoints[4].y = y4;
  meshPoints[5].x = x5; 
  meshPoints[5].y = y5;
  meshPoints[6].x = x6; 
  meshPoints[6].y = y6;
  meshPoints[7].x = x7; 
  meshPoints[7].y = y7;
  meshPoints[8].x = x8; 
  meshPoints[8].y = y8;
  meshPoints[9].x = x9; 
  meshPoints[9].y = y9;
  meshPoints[10].x = x10; 
  meshPoints[10].y = y10;
  meshPoints[11].x = x11; 
  meshPoints[11].y = y11;
  meshPoints[12].x = x12; 
  meshPoints[12].y = y12;
  meshPoints[13].x = x13; 
  meshPoints[13].y = y13;
  meshPoints[14].x = x14; 
  meshPoints[14].y = y14;
  meshPoints[15].x = x15; 
  meshPoints[15].y = y15;
  meshPoints[16].x = x16; 
  meshPoints[16].y = y16;
  meshPoints[17].x = x17; 
  meshPoints[17].y = y17;
  meshPoints[18].x = x18; 
  meshPoints[18].y = y18;
  meshPoints[19].x = x19; 
  meshPoints[19].y = y19;
  meshPoints[20].x = x20; 
  meshPoints[20].y = y20;
  meshPoints[21].x = x21; 
  meshPoints[21].y = y21;
  meshPoints[22].x = x22; 
  meshPoints[22].y = y22;
  meshPoints[23].x = x23; 
  meshPoints[23].y = y23;
  meshPoints[24].x = x24; 
  meshPoints[24].y = y24;
  meshPoints[25].x = x25; 
  meshPoints[25].y = y25;
  meshPoints[26].x = x26; 
  meshPoints[26].y = y26;
  meshPoints[27].x = x27; 
  meshPoints[27].y = y27;
  meshPoints[28].x = x28; 
  meshPoints[28].y = y28;
  meshPoints[29].x = x29; 
  meshPoints[29].y = y29;
  meshPoints[30].x = x30; 
  meshPoints[30].y = y30;
  meshPoints[31].x = x31; 
  meshPoints[31].y = y31;
  meshPoints[32].x = x32; 
  meshPoints[32].y = y32;
  meshPoints[33].x = x33; 
  meshPoints[33].y = y33;
  meshPoints[34].x = x34; 
  meshPoints[34].y = y34;
  meshPoints[35].x = x35; 
  meshPoints[35].y = y35;
  meshPoints[36].x = x36; 
  meshPoints[36].y = y36;
  meshPoints[37].x = x37; 
  meshPoints[37].y = y37;
  meshPoints[38].x = x38; 
  meshPoints[38].y = y38;
  meshPoints[39].x = x39; 
  meshPoints[39].y = y39;
  meshPoints[40].x = x40; 
  meshPoints[40].y = y40;
  meshPoints[41].x = x41; 
  meshPoints[41].y = y41;
  meshPoints[42].x = x42; 
  meshPoints[42].y = y42;
  meshPoints[43].x = x43; 
  meshPoints[43].y = y43;
  meshPoints[44].x = x44; 
  meshPoints[44].y = y44;
  meshPoints[45].x = x45; 
  meshPoints[45].y = y45;
  meshPoints[46].x = x46; 
  meshPoints[46].y = y46;
  meshPoints[47].x = x47; 
  meshPoints[47].y = y47;
  meshPoints[48].x = x48; 
  meshPoints[48].y = y48;
  meshPoints[49].x = x49; 
  meshPoints[49].y = y49;
  meshPoints[50].x = x50; 
  meshPoints[50].y = y50;
  meshPoints[51].x = x51; 
  meshPoints[51].y = y51;
  meshPoints[52].x = x52; 
  meshPoints[52].y = y52;
  meshPoints[53].x = x53; 
  meshPoints[53].y = y53;
  meshPoints[54].x = x54; 
  meshPoints[54].y = y54;
  meshPoints[55].x = x55; 
  meshPoints[55].y = y55;
  meshPoints[56].x = x56; 
  meshPoints[56].y = y56;
  meshPoints[57].x = x57; 
  meshPoints[57].y = y57;
  meshPoints[58].x = x58; 
  meshPoints[58].y = y58;
  meshPoints[59].x = x59; 
  meshPoints[59].y = y59;
  meshPoints[60].x = x60; 
  meshPoints[60].y = y60;
  meshPoints[61].x = x61; 
  meshPoints[61].y = y61;
  meshPoints[62].x = x62; 
  meshPoints[62].y = y62;
  meshPoints[63].x = x63; 
  meshPoints[63].y = y63;
  meshPoints[64].x = x64; 
  meshPoints[64].y = y64;
  meshPoints[65].x = x65; 
  meshPoints[65].y = y65;
}


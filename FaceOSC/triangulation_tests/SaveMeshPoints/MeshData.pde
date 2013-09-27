// LISTS OF INDICES FOR EACH FACE PART
int[] faceOutline = { 
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
};
int[] leftEyebrow = {
  17, 18, 19, 20, 21
}; 
int[] rightEyebrow = {
  22, 23, 24, 25, 26
};
int[] nosePart1 = {
  27, 28, 29, 30
};
int[] nosePart2 = {
  31, 32, 33, 34, 35
};
int[] leftEye = {
  36, 37, 38, 39, 40, 41, 36
};
int[] rightEye = {
  42, 43, 44, 45, 46, 47, 42
};
int[] mouthPart1 = { 
  48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 48
};
int[] mouthPart2 = {
  60, 65
};
int[] mouthPart3 = {
  60, 61, 62, 63, 64, 65
};

ArrayList<PVector> meshPoints;

void initMeshPoints() {
  // initialize meshPoints array with PVectors
  meshPoints = new ArrayList<PVector>(66);
  for (int i = 0; i <66; i++) {
    meshPoints.add(new PVector());
  }
}

// this method was generated programmatically. It's fugly.
public void loadMesh(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float x5, float y5, float x6, float y6, float x7, float y7, float x8, float y8, float x9, float y9, float x10, float y10, float x11, float y11, float x12, float y12, float x13, float y13, float x14, float y14, float x15, float y15, float x16, float y16, float x17, float y17, float x18, float y18, float x19, float y19, float x20, float y20, float x21, float y21, float x22, float y22, float x23, float y23, float x24, float y24, float x25, float y25, float x26, float y26, float x27, float y27, float x28, float y28, float x29, float y29, float x30, float y30, float x31, float y31, float x32, float y32, float x33, float y33, float x34, float y34, float x35, float y35, float x36, float y36, float x37, float y37, float x38, float y38, float x39, float y39, float x40, float y40, float x41, float y41, float x42, float y42, float x43, float y43, float x44, float y44, float x45, float y45, float x46, float y46, float x47, float y47, float x48, float y48, float x49, float y49, float x50, float y50, float x51, float y51, float x52, float y52, float x53, float y53, float x54, float y54, float x55, float y55, float x56, float y56, float x57, float y57, float x58, float y58, float x59, float y59, float x60, float y60, float x61, float y61, float x62, float y62, float x63, float y63, float x64, float y64, float x65, float y65) {
  //println("loading mesh...");  

  meshPoints.get(0).x = x0;
  meshPoints.get(0).y = y0;
  meshPoints.get(1).x = x1;
  meshPoints.get(1).y = y1;
  meshPoints.get(2).x = x2;
  meshPoints.get(2).y = y2;
  meshPoints.get(3).x = x3;
  meshPoints.get(3).y = y3;
  meshPoints.get(4).x = x4;
  meshPoints.get(4).y = y4;
  meshPoints.get(5).x = x5;
  meshPoints.get(5).y = y5;
  meshPoints.get(6).x = x6;
  meshPoints.get(6).y = y6;
  meshPoints.get(7).x = x7;
  meshPoints.get(7).y = y7;
  meshPoints.get(8).x = x8;
  meshPoints.get(8).y = y8;
  meshPoints.get(9).x = x9;
  meshPoints.get(9).y = y9;
  meshPoints.get(10).x = x10;
  meshPoints.get(10).y = y10;
  meshPoints.get(11).x = x11;
  meshPoints.get(11).y = y11;
  meshPoints.get(12).x = x12;
  meshPoints.get(12).y = y12;
  meshPoints.get(13).x = x13;
  meshPoints.get(13).y = y13;
  meshPoints.get(14).x = x14;
  meshPoints.get(14).y = y14;
  meshPoints.get(15).x = x15;
  meshPoints.get(15).y = y15;
  meshPoints.get(16).x = x16;
  meshPoints.get(16).y = y16;
  meshPoints.get(17).x = x17;
  meshPoints.get(17).y = y17;
  meshPoints.get(18).x = x18;
  meshPoints.get(18).y = y18;
  meshPoints.get(19).x = x19;
  meshPoints.get(19).y = y19;
  meshPoints.get(20).x = x20;
  meshPoints.get(20).y = y20;
  meshPoints.get(21).x = x21;
  meshPoints.get(21).y = y21;
  meshPoints.get(22).x = x22;
  meshPoints.get(22).y = y22;
  meshPoints.get(23).x = x23;
  meshPoints.get(23).y = y23;
  meshPoints.get(24).x = x24;
  meshPoints.get(24).y = y24;
  meshPoints.get(25).x = x25;
  meshPoints.get(25).y = y25;
  meshPoints.get(26).x = x26;
  meshPoints.get(26).y = y26;
  meshPoints.get(27).x = x27;
  meshPoints.get(27).y = y27;
  meshPoints.get(28).x = x28;
  meshPoints.get(28).y = y28;
  meshPoints.get(29).x = x29;
  meshPoints.get(29).y = y29;
  meshPoints.get(30).x = x30;
  meshPoints.get(30).y = y30;
  meshPoints.get(31).x = x31;
  meshPoints.get(31).y = y31;
  meshPoints.get(32).x = x32;
  meshPoints.get(32).y = y32;
  meshPoints.get(33).x = x33;
  meshPoints.get(33).y = y33;
  meshPoints.get(34).x = x34;
  meshPoints.get(34).y = y34;
  meshPoints.get(35).x = x35;
  meshPoints.get(35).y = y35;
  meshPoints.get(36).x = x36;
  meshPoints.get(36).y = y36;
  meshPoints.get(37).x = x37;
  meshPoints.get(37).y = y37;
  meshPoints.get(38).x = x38;
  meshPoints.get(38).y = y38;
  meshPoints.get(39).x = x39;
  meshPoints.get(39).y = y39;
  meshPoints.get(40).x = x40;
  meshPoints.get(40).y = y40;
  meshPoints.get(41).x = x41;
  meshPoints.get(41).y = y41;
  meshPoints.get(42).x = x42;
  meshPoints.get(42).y = y42;
  meshPoints.get(43).x = x43;
  meshPoints.get(43).y = y43;
  meshPoints.get(44).x = x44;
  meshPoints.get(44).y = y44;
  meshPoints.get(45).x = x45;
  meshPoints.get(45).y = y45;
  meshPoints.get(46).x = x46;
  meshPoints.get(46).y = y46;
  meshPoints.get(47).x = x47;
  meshPoints.get(47).y = y47;
  meshPoints.get(48).x = x48;
  meshPoints.get(48).y = y48;
  meshPoints.get(49).x = x49;
  meshPoints.get(49).y = y49;
  meshPoints.get(50).x = x50;
  meshPoints.get(50).y = y50;
  meshPoints.get(51).x = x51;
  meshPoints.get(51).y = y51;
  meshPoints.get(52).x = x52;
  meshPoints.get(52).y = y52;
  meshPoints.get(53).x = x53;
  meshPoints.get(53).y = y53;
  meshPoints.get(54).x = x54;
  meshPoints.get(54).y = y54;
  meshPoints.get(55).x = x55;
  meshPoints.get(55).y = y55;
  meshPoints.get(56).x = x56;
  meshPoints.get(56).y = y56;
  meshPoints.get(57).x = x57;
  meshPoints.get(57).y = y57;
  meshPoints.get(58).x = x58;
  meshPoints.get(58).y = y58;
  meshPoints.get(59).x = x59;
  meshPoints.get(59).y = y59;
  meshPoints.get(60).x = x60;
  meshPoints.get(60).y = y60;
  meshPoints.get(61).x = x61;
  meshPoints.get(61).y = y61;
  meshPoints.get(62).x = x62;
  meshPoints.get(62).y = y62;
  meshPoints.get(63).x = x63;
  meshPoints.get(63).y = y63;
  meshPoints.get(64).x = x64;
  meshPoints.get(64).y = y64;
  meshPoints.get(65).x = x65;
  meshPoints.get(65).y = y65;

  saveMesh();
}

void saveMesh() {

  PrintWriter output = createWriter("positions.csv"); 
  for (PVector v : meshPoints) {
    output.println(v.x+","+v.y);
  }
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
}

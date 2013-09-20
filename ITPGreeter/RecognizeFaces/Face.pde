// Which Face Is Which
// Daniel Shiffman
// http://www.shiffman.net

class Face {

  // A Rectangle
  Rectangle r;

  // Am I available to be matched?
  boolean available;

  // Should I be deleted?
  boolean delete;

  // How long should I live if I have disappeared?
  int timer = 127;

  // Assign a number to each face
  int id;

  PImage img;
  String path;

  FloatDict matches;

  boolean selected = false;

  String name = "";

  // Make me
  Face(int x, int y, int w, int h, int faceCount) {
    r = new Rectangle(x, y, w, h);

    available = true;
    delete = false;
    id = faceCount;

    // auto-recognize
    recognize();
  }


  void saveFace(PImage i) {
    img = i;
    path = "faces/face-"+id+".jpg";
    img.save(path);
  }

  void recognize() {
    PImage cropped = cropFace(cam);
    saveFace(cropped);
    RFace[] faces = rekog.recognizeFace(path);
    if (faces != null && faces.length > 0) {
      matches = faces[0].getMatches();
    }
  }

  // Show me
  void display() {
    fill(0, 0, 255, timer);
    if (selected) {
      fill(255, 0, 0, timer);
    }
    stroke(0, 0, 255);
    rect(r.x*scl, r.y*scl, r.width*scl, r.height*scl);
    fill(255, timer*2);
    text("id: "+id, r.x*scl+10, r.y*scl+30);
    text("name: "+name, r.x*scl+10, r.y*scl+45);

    if (matches != null) {
      fill(255);
      String display = "";
      for (String key : matches.keys()) {
        float likely = matches.get(key);
        display += key + ": " + likely + "\n";
        // We could also get Age, Gender, Smiling, Glasses, and Eyes Closed data like in the FaceDetect example
        text(display, r.x*scl+10, r.y*scl+75);
      }
    } 
    else {
      if (frameCount % 60 == 0) {
        recognize();
      }
    }
  }

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  void update(Rectangle newR) {
    r = (Rectangle) newR.clone();
  }

  // Count me down, I am gone
  void countDown() {
    timer--;
  }

  // I am deed, delete me
  boolean dead() {
    if (timer < 0) return true;
    return false;
  }

  PImage cropFace(PImage source) {
    PImage img = createImage(r.width*scl, r.height*scl, RGB);
    img.copy(source, r.x*scl, r.y*scl, r.width*scl, r.height*scl, 0, 0, r.width*scl, r.height*scl);
    img.updatePixels();
    return img;
  }

  boolean inside(float x, float y) {
    return r.contains(x/scl, y/scl);
  }

  void selected(boolean b) {
    selected = b;
  }  

  void setName(String s) {
    name = s;
  }

  void train() {
    rekog.addFace(path, name);

    // We need a second API call to train Rekognition of whatever faces have been added
    // Here it's one face, then train, but you could add a lot of faces before training
    rekog.train();
  }
}


// Face Recognizer App
// OpenCV + Rekognition API

// This class keeps track of a Face that is currently on screen
// It can ask Rekognition who it is or tell Rekognition who it is

// It also matches itself with any new faces from OpenCV to guess which
// face is which over time

class Face {

  // A Rectangle
  Rectangle r;

  // Am I available?
  boolean available;

  // Should I be deleted?
  boolean delete;

  // How long should I live if I have disappeared?
  int timer = 127;

  // Assign a number to each face
  int id;


  // Keep track of a separate PImage and path to a file
  PImage img;
  String path;

  // Dictionary of name probabilities
  FloatDict matches;

  // User interaction: Am I selected or being rolled over?
  boolean selected = false;
  boolean rollover = false;

  // Who am I really?
  String name = "";
  // Who doe Rekognition think I am?
  String guess = "";

  // Threaded requests to API
  RecognizeRequest rreq;
  TrainRequest treq;


  // Constuctor
  Face(int x, int y, int w, int h, int faceCount) {
    r = new Rectangle(x, y, w, h);

    // We are initially available to OpenCV and should not be deleted
    available = true;
    delete = false;
    id = faceCount;

    // Ask Rekognition who I am
    recognize();
  }

  // Save face as an image
  // (This is temporary and overwritten each time)
  void saveFace(PImage i) {
    img = i;
    path = "faces/face-"+id+".jpg";
    img.save(path);
  }

  // Crop the image into a smaller PImage
  PImage cropFace(PImage source) {
    PImage img = createImage(r.width*scl, r.height*scl, RGB);
    img.copy(source, r.x*scl, r.y*scl, r.width*scl, r.height*scl, 0, 0, r.width*scl, r.height*scl);
    img.updatePixels();
    return img;
  }

  // What requests are active and are any done
  void checkRequests() {
    // Has a rekognition request finished?
    if (rreq != null && rreq.done) {
      // Get the matches and set back to null
      matches = rreq.getMatches();
      rreq = null;
      // As long as it found a match the guess it the first one
      if (matches.size() > 0) {
        guess = matches.keyArray()[0];
      } 
      // Otherwise no matches, set to null to restart checking
      else {
        matches = null;
      }
    }

    // If a training request has completed set that to null and 
    // start a rekognition request
    if (treq != null && treq.done) {
      treq = null;
      recognize();
    }

    // If we have no matches and no active request
    // Let's make a request
    if (matches == null && rreq == null) {
      recognize();
    }
  }

  // Copy the image of the face and start a recognition request
  void recognize() {
    PImage cropped = cropFace(cam);
    saveFace(cropped);
    rreq = new RecognizeRequest(path);
    rreq.start();
  }


  // make a training request
  void train() {
    treq = new TrainRequest(path, name);
    treq.start();
  }

  // Display method
  void display() {

    // Fade color out over time
    fill(0, 0, 255, timer);
    if (rollover) {
      fill(255, 0, 255, timer);
    } 
    else if (selected) {
      fill(255, 0, 0, timer);
    }
    // Draw the face
    stroke(0, 0, 255);
    rect(r.x*scl, r.y*scl, r.width*scl, r.height*scl);
    fill(255);

    // Draw the ID and guess
    text("id: "+id, r.x*scl+10, r.y*scl+30);
    text("Guess: "+guess, r.x*scl+10, r.y*scl+45);


    // Display info based on selection status
    if (selected) {
      text("Enter actual name: " + name, r.x*scl+10, r.y*scl+r.height*scl-15);
    } 
    else if (rollover) {
      text("Click to enter name.", r.x*scl+10, r.y*scl+r.height*scl-15);
    }


    // Display matches and guess info
    if (matches != null) {
      String display = "";
      for (String key : matches.keys()) {
        float likely = matches.get(key);
        display += key + ": " + int(likely*100) + "%\n";
        // We could also get Age, Gender, Smiling, Glasses, and Eyes Closed data like in the FaceDetect example
        text(display, r.x*scl+10, r.y*scl+75);
      }
    }
  }

  // Methods below are for keeping track of rectangles over time

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  void update(Rectangle newR) {
    r = (Rectangle) newR.clone();
  }

  // Count me down, I am gone
  void countDown() {
    timer--;
  }

  // I am dead, delete me
  boolean dead() {
    if (timer < 0) return true;
    return false;
  }

  // Check it mouse is inside
  boolean inside(float x, float y) {
    return r.contains(x/scl, y/scl);
  }

  // Set rollover to true or false
  void rollover(boolean b) {
    rollover = b;
  }


  // Set selection
  void selected(boolean b) {
    selected = b;
  }  

  // Set name
  void setName(String s) {
    name = s;
  }
}


// Face Recognizer App
// OpenCV + Rekognition API

// This class keeps track of a Face that is currently on screen
// It can ask Rekognition who it is or tell Rekognition who it is

// It also matches itself with any new faces from OpenCV to guess which
// face is which over time

class Face {

  // Let's not use the rectangle, ints in limiting
  // Rectangle r;
  float x, y, w, h;

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
  Face(Rectangle r, int faceCount) {
    x = r.x;
    y = r.y;
    w = r.width;
    h = r.height;

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
    PImage img = createImage(int(w*openCVScale), int(h*openCVScale), RGB);
    img.copy(source, int(x*openCVScale), int(y*openCVScale), int(w*openCVScale), int(h*openCVScale), 0, 0, int(w*openCVScale), int(h*openCVScale));
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
    rect(x*scl, y*scl, w*scl, h*scl);
    fill(255);

    // Draw the ID and guess
    text("id: "+id, x*scl+10, y*scl+30);
    text("Guess: "+guess, x*scl+10, y*scl+45);


    if (treq != null) {
      String dots = "";
      for (int i = 0; i < frameCount/15 % 4; i++) {
        dots += ".";
      }
      text("Training"+dots, x*scl+10, y*scl+h*scl-15);   
      // Display info based on selection status
    } 
    else if (selected) {
      text("Enter actual name: " + name, x*scl+10, y*scl+h*scl-15);
    } 
    else if (rollover) {
      text("Click to enter name.", x*scl+10, y*scl+h*scl-15);
    }


    if (rreq != null) {
      String dots = "";
      for (int i = 0; i < frameCount/15 % 4; i++) {
        dots += ".";
      }
      text("Loading"+dots, x*scl+10, y*scl+75);
      // Display matches and guess info
    } 
    else if (matches != null) {
      String display = "";
      for (String key : matches.keys()) {
        float likely = matches.get(key);
        display += key + ": " + int(likely*100) + "%\n";
        // We could also get Age, Gender, Smiling, Glasses, and Eyes Closed data like in the FaceDetect example
        text(display, x*scl+10, y*scl+75);
      }
    }
  }

  // Methods below are for keeping track of rectangles over time

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  void update(Rectangle newR) {
    //r = (Rectangle) newR.clone();
    x = lerp(x, newR.x, 0.1);
    y = lerp(y, newR.y, 0.1);
    w = lerp(w, newR.width, 0.1);
    h = lerp(h, newR.height, 0.1);

    // If it lives you should get a new timer
    timer = 127;
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
  boolean inside(float px, float py) {
    px = px/scl;
    py = py/scl;
    return (px > x && px < x + w && py > y && py < y + h);
  }

  // Set rollover to true or false
  void rollover(boolean b) {
    rollover = b;
  }


  // Set selection
  void selected(boolean b) {
    selected = b;
    if (selected) {
      name = ""; 
    }
  }  

  // Set name
  void setName(String s) {
    name = s;
  }
}


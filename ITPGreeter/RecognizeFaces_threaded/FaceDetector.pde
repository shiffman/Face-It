// Face Recognizer App
// OpenCV + Rekognition API

// This class keeps track of the list of faces on screen
// It also knows which faces are new this frame for recognition

class FaceDetector {
  // A list of my Face objects
  ArrayList<Face> faceList;
  ArrayList<Face> newFaces;

  // How many have I found over all time
  int faceCount = 0;

  // Is a face selected?
  boolean selected = false;

  FaceDetector() {
    faceList = new ArrayList<Face>();
    newFaces = new ArrayList<Face>();
  }

  // Update the list of faces based on current Rectangles from OpenCV
  void detect(Rectangle[] faces) {

    // Assume no new faces
    newFaces.clear();

    // SCENARIO 1: faceList is empty
    if (faceList.isEmpty()) {
      // Just make a Face object for every face Rectangle
      for (int i = 0; i < faces.length; i++) {
        Face f = new Face(faces[i].x, faces[i].y, faces[i].width, faces[i].height, faceCount);
        newFace(f);
      }
      // SCENARIO 2: We have fewer Face objects than face Rectangles found from OPENCV
    } 
    else if (faceList.size() <= faces.length) {
      boolean[] used = new boolean[faces.length];
      // Match existing Face objects with a Rectangle
      for (Face f : faceList) {
        // Find faces[index] that is closest to face f
        // set used[index] to true so that it can't be used twice
        float record = 50000;
        int index = -1;
        for (int i = 0; i < faces.length; i++) {
          float d = dist(faces[i].x, faces[i].y, f.r.x, f.r.y);
          if (d < record && !used[i]) {
            record = d;
            index = i;
          }
        }
        // Update Face object location
        used[index] = true;
        f.update(faces[index]);
      }
      // Add any unused faces
      for (int i = 0; i < faces.length; i++) {
        if (!used[i]) {
          Face f = new Face(faces[i].x, faces[i].y, faces[i].width, faces[i].height, faceCount);
          newFace(f);
        }
      }
      // SCENARIO 3: We have more Face objects than face Rectangles found
    } 
    else {
      // All Face objects start out as available
      for (Face f : faceList) {
        f.available = true;
      } 
      // Match Rectangle with a Face object
      for (int i = 0; i < faces.length; i++) {
        // Find face object closest to faces[i] Rectangle
        // set available to false
        float record = 50000;
        int index = -1;
        for (int j = 0; j < faceList.size(); j++) {
          Face f = faceList.get(j);
          float d = dist(faces[i].x, faces[i].y, f.r.x, f.r.y);
          if (d < record && f.available) {
            record = d;
            index = j;
          }
        }
        // Update Face object location
        Face f = faceList.get(index);
        f.available = false;
        f.update(faces[i]);
      } 
      // Start to kill any left over Face objects
      for (Face f : faceList) {
        if (f.available) {
          f.countDown();
          if (f.dead()) {
            f.delete = true;
          }
        }
      }
    }

    // Delete any that should be deleted
    for (int i = faceList.size()-1; i >= 0; i--) {
      Face f = faceList.get(i);
      if (f.delete) {
        faceList.remove(i);
      }
    }
  }

  // See if we've clicked on a Face
  void click(float x, float y) {
    for (Face f : faceList) {
      if (f.inside(x, y)) {
        f.selected(true);
        selected = true;
      }
    }
  }

  // See if we are rolling over a Face
  void rollover(float x, float y) {
    for (Face f : faceList) {
      if (f.inside(x, y)) {
        f.rollover(true);
      } 
      else {
        f.rollover(false);
      }
    }
  }


  // Set the name of the face that is selected
  void enter(String s, boolean finished) {
    for (Face f : faceList) {
      if (f.selected) {
        f.setName(s);
        if (finished) {
          selected = false;
          f.selected(false);
          f.train();
        }
      }
    }
  }

  // Add a new face to the world
  void newFace(Face f) {
    faceList.add(f);
    newFaces.add(f);
    faceCount++;
  }


  // Draw all the faces
  void showFaces() {
    for (Face f : faceList) {
      f.display();
    }
  }
  
  // Check any requests for any faces
  void checkRequests() {
    for (Face f : faceList) {
      f.checkRequests();
    }
  }

}


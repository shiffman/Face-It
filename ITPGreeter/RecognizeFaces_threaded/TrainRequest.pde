// Face Recognizer App
// OpenCV + Rekognition API

// This class is a separate thread to train a face

class TrainRequest extends Thread {
  
  // Path to face image
  String path;
  // Name of face
  String name;
  // Is the thread complete?
  boolean done;

  // Create the request
  TrainRequest (String s, String n) {
    path = s;
    name = n;
    done = false;
  }
  
  // Perform the request
  void run () {
    rekog.addFace(path, name);

    // We need a second API call to train Rekognition of whatever faces have been added
    // Here it's one face, then train, but you could add a lot of faces before training
    rekog.train();
    
    // The request is complete
    done = true;
  }

}


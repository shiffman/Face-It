// Face Recognizer App
// OpenCV + Rekognition API

// This class is a separate thread to recognize a face

class RecognizeRequest extends Thread {
  
  // path to recognize
  String path;
  
  // Is the thread done?
  boolean done;
  
  // What matches are there?
  FloatDict matches;
  
  // Create the request
  RecognizeRequest(String s) {
    path = s;
    matches = new FloatDict();
    done = false;
  }
  
  // Perform the request
  void run () {
    RFace[] faces = rekog.recognize(path);
    if (faces != null && faces.length > 0) {
      // We are assuming there is just one face in each image
      matches = faces[0].getMatches();
      // Sort by most likely
      matches.sortValuesReverse();
    }
    // Request is complete
    done = true;
  }
  
  // Return the matches
  FloatDict getMatches() {
    return matches; 
  }

}


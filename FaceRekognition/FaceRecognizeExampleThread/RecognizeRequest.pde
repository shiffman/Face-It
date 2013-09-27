// Recognize a Face
// Daniel Shiffman
// https://github.com/shiffman/RekognitionProcessing
// http://rekognition.com/

// A class to make a request as a separate thread
// This is so that the animation can continue without pausing
// This could also be accomplished with the more simple "thread()" method in Processing
// See: http://wiki.processing.org/w/Threading for more info

class RecognizeRequest extends Thread {
  
  // path to recognize
  String path;
  
  // Is the thread done?
  boolean done;
  
  // What matches are there?
  FloatDict matches;
  
  // What faces are there
  RFace[] faces;
  
  // Create the request
  RecognizeRequest(String s) {
    path = s;
    matches = new FloatDict();
    done = false;
  }
  
  // Perform the request
  void run () {
    faces = rekog.recognize(path);
    if (faces != null && faces.length > 0) {
      // We are assuming there is just one face in each image
      matches = faces[0].getMatches();
      // Sort by most likely
      matches.sortValuesReverse();
    }
    // Request is complete
    done = true;
  }
  
  RFace[] getFaces() {
    return faces; 
  }
  
  // Return the matches
  FloatDict getMatches() {
    return matches; 
  }

}


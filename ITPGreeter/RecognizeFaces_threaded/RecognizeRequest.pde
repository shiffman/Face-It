
class RecognizeRequest extends Thread {

  String path;
  
  boolean done;
  
  FloatDict matches;

  RecognizeRequest (String s) {
    path = s;
    matches = new FloatDict();
    done = false;
  }

  void run () {
    RFace[] faces = rekog.recognizeFace(path);
    if (faces != null && faces.length > 0) {
      matches = faces[0].getMatches();
      matches.sortValuesReverse();
    }
    done = true;
  }
  
  FloatDict getMatches() {
    return matches; 
  }

}


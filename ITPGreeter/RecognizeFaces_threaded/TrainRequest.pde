
class TrainRequest extends Thread {

  String path;
  String name;
  boolean done;

  TrainRequest (String s, String n) {
    path = s;
    name = n;
    done = false;
  }

  void run () {
    rekog.addFace(path, name);

    // We need a second API call to train Rekognition of whatever faces have been added
    // Here it's one face, then train, but you could add a lot of faces before training
    rekog.train();

    done = true;
  }

}


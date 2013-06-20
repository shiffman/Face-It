// This example requires two libraries, these are temporary download links:
// https://www.dropbox.com/s/xr09pdaoul7wqpd/RekognitionProcessing.zip
// https://www.dropbox.com/s/fqzddqqfhzt7580/HTTProcessing.zip

// Also, you need an API key.
// Sign up here: http://rekognition.com/register/
// Make a text file in your data folder called key.txt
// Put your API key on the first line and your API secret on the second line

import httprocessing.*;
import rekognition.faces.*;

PImage img;
RekognitionFace facerekog;
Face[] faces;

void setup() {
  size(800, 400);

  // load image for drawing
  String filename = "obama.jpg";
  img = loadImage(filename);

  // Load the API keys
  String[] keys = loadStrings("key.txt");
  String api_key = keys[0];
  String api_secret = keys[1];

  // Create the face recognizer object
  facerekog = new RekognitionFace(this, api_key, api_secret);

  // Recognize faces in image
  faces = facerekog.recognizeFace(sketchPath("data/"+filename));
}

void draw() {
  background(0);

  // Draw the image
  image(img, 0, 0);


  // The face objects have lots of information stored
  for (int i = 0; i < faces.length; i++) {
    stroke(255, 0, 0);
    strokeWeight(1);
    noFill();
    rectMode(CENTER);

    // Face center, with, and height
    // We could also get eye, mouth, and nose positions like in FaceDetect
    rect(faces[i].center.x, faces[i].center.y, faces[i].w, faces[i].h);  

    // Possible face matches come back in a FloatDict
    // A string (name of face) is paired with a float from 0 to 1 (how likely is it that face)
    FloatDict matches = faces[i].getMatches();
    fill(255);
    String display = "";
    for (String key : matches.keys()) {
      float likely = matches.get(key);
      display += key + ": " + likely + "\n";
    }

    // We could also get Age, Gender, Smiling, Glasses, and Eyes Closed data like in the FaceDetect example
    text(display, img.width+10, 60);

  }
}


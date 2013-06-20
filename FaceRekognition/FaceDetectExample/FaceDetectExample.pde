// This example requires two libraries, these are temporary download links:
// https://www.dropbox.com/s/xr09pdaoul7wqpd/RekognitionProcessing.zip
// https://www.dropbox.com/s/fqzddqqfhzt7580/HTTProcessing.zip

// Also, you need an API key.
// Sign up here: http://rekognition.com/register/
// Make a text file in your data folder called key.txt
// Put your API key on the first line and your API secret on the second line

import httprocessing.*;
import rekognition.faces.*;

RekognitionFace facerekog;

PImage img;
Face[] faces;

void setup() {
  size(800, 600);
  
  // load image for drawing
  String filename = "obama.jpg";
  img = loadImage(filename);
  
  // Load the API keys
  String[] keys = loadStrings("key.txt");
  String api_key = keys[0];
  String api_secret = keys[1];
  
  // Create the face recognizer object
  facerekog = new RekognitionFace(this, api_key, api_secret);
  
  // Detect faces in image
  // We will get a list of Face objects
  faces = facerekog.detectFacesPath(sketchPath("data/"+filename));
}

void draw() {
  background(0);
  
  // Draw the image
  image(img, 0, 0);
  
  // The face objects have lots of information stored
  for (int i = 0; i < faces.length; i++) {
    stroke(0, 0, 0);
    strokeWeight(1);
    noFill();
    rectMode(CENTER);
    rect(faces[i].center.x, faces[i].center.y, faces[i].w, faces[i].h);  // Face center, with, and height
    rect(faces[i].eye_right.x, faces[i].eye_right.y, 4, 4);              // Right eye
    rect(faces[i].eye_left.x, faces[i].eye_left.y, 4, 4);                // Left eye
    rect(faces[i].mouth_left.x, faces[i].mouth_left.y, 4, 4);            // Mouth Left
    rect(faces[i].mouth_right.x, faces[i].mouth_right.y, 4, 4);          // Mouth right
    rect(faces[i].nose.x, faces[i].nose.y, 4, 4);                        // Nose
    fill(0,255,0);
    String display = "Age: " + int(faces[i].age) + "\n\n";                        // Age
    display += "Gender: " + faces[i].gender + "\n";                               // Gender
    display += "Gender rating: " + nf(faces[i].gender_rating, 1, 2) + "\n\n";     // Gender from 0 to 1, 1 male, 0 female
    display += "Smiling: " + faces[i].smiling + "\n";                             // Smiling
    display += "Smile rating: " + nf(faces[i].smile_rating, 1, 2) + "\n\n";       // Smiling from 0 to 1
    display += "Glasses: " + faces[i].glasses + "\n";                             // Glasses
    display += "Glasses rating: " + nf(faces[i].glasses_rating, 1, 2) + "\n\n";   // Glasses from 0 to 1
    display += "Eyes closed: " + faces[i].eyes_closed + "\n";                               // Eyes closed
    display += "Eyes closed rating: " + nf(faces[i].eyes_closed_rating, 1, 2) + "\n\n";     // Eyes closed from 0 to 1
    text(display, faces[i].left(), faces[i].bottom()+20);                         // Draw all text below face rectangle
  }
}


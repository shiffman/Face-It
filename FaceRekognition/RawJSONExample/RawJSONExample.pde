// See raw JSON from API
// Daniel Shiffman
// https://github.com/shiffman/RekognitionProcessing
// http://rekognition.com/

// This example also requires HTTProcessing.zip
// https://www.dropbox.com/s/fqzddqqfhzt7580/HTTProcessing.zip

// Also, you need an API key.
// Sign up here: http://rekognition.com/register/
// Make a text file in your data folder called key.txt
// Put your API key on the first line and your API secret on the second line

import httprocessing.*;
import rekognition.faces.*;

Rekognition rekog;

PImage img;
RFace[] faces;

String json = "";

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
  rekog = new Rekognition(this, api_key, api_secret);
  
  // We can get a post request
  PostRequest post = rekog.createPostRequest();
  // And manually configure it
  post.addData("job_list", "face_recognize_part_gender_emotion_age_glass");
  // Adding a file
  File f = new File(dataPath(filename));
  post.addFile("uploaded_file", f);
  // And send it
  post.send();
  // Now we can look at the raw JSON
  json = post.getContent();
  
  faces = rekog.facesFromJSON(json);
  
  // Print JSON to console
  println(json);
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
    fill(0, 255, 0);
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


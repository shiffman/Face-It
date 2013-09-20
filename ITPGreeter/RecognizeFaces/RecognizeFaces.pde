// Which Face Is Which
// Daniel Shiffman

import rekognition.faces.RFace;
import rekognition.faces.Rekognition;

import processing.video.*;

import gab.opencvpro.*;
import java.awt.Rectangle;

import httprocessing.*;


OpenCVPro opencv;

Capture cam;
PImage smaller;

// Scaling down the video
int scl = 4;

Rekognition rekog;

FaceDetector detector;

String typed = "";

void setup() {
  size( 640, 480 );
  opencv = new OpenCVPro(this, width/scl, height/scl);
  smaller = createImage(opencv.width, opencv.height, RGB);
  cam = new Capture(this, width, height);
  cam.start();
  opencv.loadCascade(OpenCVPro.CASCADE_FRONTALFACE_ALT); 


  String[] keys = loadStrings("key.txt");
  String k = keys[0];
  String secret = keys[1];
  rekog = new Rekognition(this, k, secret);
  rekog.setNamespace("faceit2");
  rekog.setUserID("shiffman");
  
  detector = new FaceDetector();
}

void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  background(0);
  image(cam, 0, 0);

  smaller.copy(cam, 0, 0, cam.width, cam.height, 0, 0, smaller.width, smaller.height);
  smaller.updatePixels();
  opencv.loadImage(smaller);

  Rectangle[] faces = opencv.detect();
  detector.detect(faces);

  detector.showFaces();
  detector.rollover(mouseX,mouseY);
  //detector.saveNewFaces();
  //detector.recognizeNewFaces();
}

void mousePressed() {
  detector.click(mouseX, mouseY);
}

void keyPressed() {

  if (detector.selected) {
    if (key == '\n') {
      detector.enter(typed,true);
      typed = "";
    } 
    else {
      typed = typed + key;
      detector.enter(typed,false);
    }
  }
}


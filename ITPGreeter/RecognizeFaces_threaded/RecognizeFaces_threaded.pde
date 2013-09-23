// Face Recognizer App
// OpenCV + Rekognition API

// [opencv link]
// [rekognition API link]
// [github repo for classes link]

// Rekognition Library
import rekognition.faces.*;

// Video library
import processing.video.*;

// OpenCV Library
import gab.opencvpro.*;

// Also need HTTP Requests for Rekognition
import httprocessing.*;

// Java Rectangle class
import java.awt.Rectangle;


// OpenCV and Capture
OpenCVPro opencv;
Capture cam;

// We will need a smaller image for fast real-time detection
PImage smaller;
int scl = 4;  // scale down factor

// Rekognition API 
Rekognition rekog;

// An object to do OpenCV detection
FaceDetector detector;

// For the user to type in their name
// This is awkard and needs to be improved
String typed = "";

void setup() {
  size(640, 480);
  
  // OpenCV object
  opencv = new OpenCVPro(this, width/scl, height/scl);
  opencv.loadCascade(OpenCVPro.CASCADE_FRONTALFACE_ALT); 
  
  // Scaled down image
  smaller = createImage(opencv.width, opencv.height, RGB);
  // Larger capture object
  cam = new Capture(this, width, height);
  cam.start();
  
  // Setting up Rekognition API
  String[] keys = loadStrings("key.txt");
  String k = keys[0];
  String secret = keys[1];
  rekog = new Rekognition(this, k, secret);
  // You can have different databases of faces for different applications
  rekog.setNamespace("faceit2");
  rekog.setUserID("shiffman");
  
  // A generic time-based face detector
  detector = new FaceDetector();
}

// Get images from camera
void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  
  background(0);
  // Draw video
  image(cam, 0, 0);
  
  // Scale down video and pass to OpenCV
  smaller.copy(cam, 0, 0, cam.width, cam.height, 0, 0, smaller.width, smaller.height);
  smaller.updatePixels();
  opencv.loadImage(smaller);

  // Get an array of rectangles and send to the detector
  Rectangle[] faces = opencv.detect();
  detector.detect(faces);
  
  // Draw the faces
  detector.showFaces();
  // Check for any requests to Rekognition API
  detector.checkRequests();
  // Check to see if user is rolling over faces
  detector.rollover(mouseX,mouseY);
}

void mousePressed() {
  // Check to see if user clicked on a face
  detector.click(mouseX, mouseY);
}

void keyPressed() {
  
  // This should really be improved, super basic keyboard input for name
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


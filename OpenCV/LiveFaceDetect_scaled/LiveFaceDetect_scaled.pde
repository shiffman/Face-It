// Face It
// ITP Fall 2013
// Daniel Shiffman

// Now we need the video library
import processing.video.*;

// Import the library
import gab.opencv.*;

// We need Java rectangles
import java.awt.Rectangle;

// Library object
OpenCV opencv;

// Capture object
Capture cam;

// Scaled down image
PImage smaller;

// Array of faces found
Rectangle[] faces;

int scale = 4;

void setup() {
  size(640, 480);
  
  // Start capturing
  cam = new Capture(this, 640, 480);
  cam.start();

  // Create the OpenCV object
  opencv = new OpenCV(this, cam.width/scale, cam.height/scale);
  
  // Which "cascade" are we going to use?
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
 
  // Make scaled down image
  smaller = createImage(opencv.width,opencv.height,RGB);
 
  
}

// New images from camera
void captureEvent(Capture cam) {
  cam.read();
  
  // Make smaller image
  smaller.copy(cam,0,0,cam.width,cam.height,0,0,smaller.width,smaller.height);
  smaller.updatePixels();
}

void draw() {
  
  background(0);
  
  // We have to always "load" the  image into OpenCV 
  // But we check against the smaller image here
  opencv.loadImage(smaller);
  
  // Detect the faces
  faces = opencv.detect();
  
  // Draw the video
  image(cam, 0, 0);

  // If we find faces, draw them!
  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      strokeWeight(2);
      stroke(255,0,0);
      noFill();
      rect(faces[i].x*scale, faces[i].y*scale, faces[i].width*scale, faces[i].height*scale);
    }
  }
}


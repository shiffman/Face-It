// Which Face Is Which
// Daniel Shiffman

import processing.video.*;

import gab.opencvpro.*;
import java.awt.Rectangle;


OpenCVPro opencv;

Capture cam;
PImage smaller;

// A list of my Face objects
ArrayList<Face> faceList;

// how many have I found over all time
int faceCount = 0;
// Scaling down the video
int scl = 4;

void setup() {
  size( 640, 480 );
  opencv = new OpenCVPro(this, width/scl, height/scl);
  smaller = createImage(opencv.width,opencv.height,RGB);
  cam = new Capture(this, width, height);
  cam.start();
  opencv.loadCascade(OpenCVPro.CASCADE_FRONTALFACE_ALT);  
  faceList = new ArrayList<Face>();
}

void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  background(0);
  image(cam,0,0);
  
  smaller.copy(cam,0,0,cam.width,cam.height,0,0,smaller.width,smaller.height);
  smaller.updatePixels();
  opencv.loadImage(smaller);

  Rectangle[] faces = opencv.detect();

  // SCENARIO 1: faceList is empty
  if (faceList.isEmpty()) {
    // Just make a Face object for every face Rectangle
    for (int i = 0; i < faces.length; i++) {
      faceList.add(new Face(faces[i].x, faces[i].y, faces[i].width, faces[i].height));
    }
    // SCENARIO 2: We have fewer Face objects than face Rectangles found from OPENCV
  } 
  else if (faceList.size() <= faces.length) {
    boolean[] used = new boolean[faces.length];
    // Match existing Face objects with a Rectangle
    for (Face f : faceList) {
      // Find faces[index] that is closest to face f
      // set used[index] to true so that it can't be used twice
      float record = 50000;
      int index = -1;
      for (int i = 0; i < faces.length; i++) {
        float d = dist(faces[i].x, faces[i].y, f.r.x, f.r.y);
        if (d < record && !used[i]) {
          record = d;
          index = i;
        }
      }
      // Update Face object location
      used[index] = true;
      f.update(faces[index]);
    }
    // Add any unused faces
    for (int i = 0; i < faces.length; i++) {
      if (!used[i]) {
        faceList.add(new Face(faces[i].x, faces[i].y, faces[i].width, faces[i].height));
      }
    }
    // SCENARIO 3: We have more Face objects than face Rectangles found
  } 
  else {
    // All Face objects start out as available
    for (Face f : faceList) {
      f.available = true;
    } 
    // Match Rectangle with a Face object
    for (int i = 0; i < faces.length; i++) {
      // Find face object closest to faces[i] Rectangle
      // set available to false
      float record = 50000;
      int index = -1;
      for (int j = 0; j < faceList.size(); j++) {
        Face f = faceList.get(j);
        float d = dist(faces[i].x, faces[i].y, f.r.x, f.r.y);
        if (d < record && f.available) {
          record = d;
          index = j;
        }
      }
      // Update Face object location
      Face f = faceList.get(index);
      f.available = false;
      f.update(faces[i]);
    } 
    // Start to kill any left over Face objects
    for (Face f : faceList) {
      if (f.available) {
        f.countDown();
        if (f.dead()) {
          f.delete = true;
        }
      }
    }
  }

  // Delete any that should be deleted
  for (int i = faceList.size()-1; i >= 0; i--) {
    Face f = faceList.get(i);
    if (f.delete) {
      faceList.remove(i);
    }
  }

  // Draw all the faces
  for (int i = 0; i < faces.length; i++) {
    noFill();
    stroke(255, 0, 0);
    rect(faces[i].x*scl, faces[i].y*scl, faces[i].width*scl, faces[i].height*scl);
  }

  for (Face f : faceList) {
    f.display();
  }
}




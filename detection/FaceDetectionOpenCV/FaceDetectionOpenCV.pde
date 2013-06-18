import processing.video.*;

import gab.opencvpro.*;
import java.awt.Rectangle;

OpenCVPro opencv;

Capture cam;
Rectangle[] faces;

void setup() {
  size(320, 240);
  opencv = new OpenCVPro(this, 320, 240);
  cam = new Capture(this, 320, 240);
  cam.start();

  opencv.loadCascade(OpenCVPro.CASCADE_FRONTALFACE_ALT);  

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
}

void captureEvent(Capture cam) {
  cam.read();
  opencv.loadImage(cam);
  faces = opencv.detect();
}

void draw() {
  background(0);

  image(cam, 0, 0);

  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      strokeWeight(2);
      stroke(255,0,0);
      noFill();
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
  }
}


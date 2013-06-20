
import gab.opencvpro.*;
import java.awt.Rectangle;

OpenCVPro opencv;
PImage img; 
Rectangle[] faces;

void setup() {
  size(640, 480);
  img = loadImage("obama.jpg");
  opencv = new OpenCVPro(this, img.width, img.height);
  opencv.loadImage(img);
  opencv.loadCascade(OpenCVPro.CASCADE_FRONTALFACE_ALT);  
  faces = opencv.detect();
}

void draw() {
  background(0);
  image(img, 0, 0);

  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      strokeWeight(2);
      stroke(255, 0, 0);
      noFill();
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
  }
}


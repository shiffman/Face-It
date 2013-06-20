// Blinking Particles
// Using: https://github.com/kylemcdonald/ofxFaceTracker/downloads

import oscP5.*;
OscP5 oscP5;

ParticleSystem ps;

void setup() {
  size(640, 480);
  frameRate(30);

  ps = new ParticleSystem(new PVector(width/2, 50));


  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "blink", "/gesture/blink");
}



void draw() {
  background(0);
  ps.run();
}

void blink(int state) {
  //println("Blink: " + state);
  if (state == 1) {
    ps.addParticle(100);
  }
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    println("UNPLUGGED: " + theOscMessage);
  }
}


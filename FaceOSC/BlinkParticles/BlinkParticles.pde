
// Face It
// ITP Fall 2013
// Daniel Shiffman

// Blinking Particles
// Using: https://github.com/kylemcdonald/ofxFaceTracker/downloads

import oscP5.*;
OscP5 oscP5;

ParticleSystem ps;

void setup() {
  size(640, 480);

  // Make a particle system
  ps = new ParticleSystem(new PVector(width/2, 50));

  oscP5 = new OscP5(this, 8338);
  // Plug in the blink gesture
  oscP5.plug(this, "blink", "/gesture/blink");
}



void draw() {
  background(0);
  ps.run();
}

void blink(int state) {
  // When you blink add 100 new particles!
  if (state == 1) {
    ps.addParticle(100);
  }
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    //println("UNPLUGGED: " + theOscMessage);
  }
}


// This triangulation code is from: http://wiki.processing.org/w/Triangulation by Tom Carden
// Based on Paul Bourke: http://paulbourke.net/papers/triangulate/ (first Java conversion by Florian Jenett)
// Modified by Daniel Shiffman for Face Morphing example


package triangulate;

import processing.core.PVector;

public class Edge {
  
  public PVector p1, p2;
  
  public Edge() {
    p1=null;
    p2=null;
  }
  
  public Edge(PVector p1, PVector p2) {
    this.p1 = p1;
    this.p2 = p2;
  }
  
}

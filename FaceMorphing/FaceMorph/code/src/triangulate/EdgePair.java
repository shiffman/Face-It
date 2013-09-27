// This triangulation code is from: http://wiki.processing.org/w/Triangulation by Tom Carden
// Based on Paul Bourke: http://paulbourke.net/papers/triangulate/ (first Java conversion by Florian Jenett)
// Modified by Daniel Shiffman for Face Morphing example

package triangulate;

import processing.core.PVector;

public class EdgePair {
  
  public Pair p1, p2;
  
  public EdgePair() {
    p1=null;
    p2=null;
  }
  
  public EdgePair(Pair p1, Pair p2) {
    this.p1 = p1;
    this.p2 = p2;
  }
  
}

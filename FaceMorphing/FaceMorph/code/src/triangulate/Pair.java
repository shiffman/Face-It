// This triangulation code is from: http://wiki.processing.org/w/Triangulation by Tom Carden
// Based on Paul Bourke: http://paulbourke.net/papers/triangulate/ (first Java conversion by Florian Jenett)
// Modified by Daniel Shiffman for Face Morphing example

package triangulate;

import processing.core.PVector;

public class Pair {
	public PVector a;
	public PVector b;

	public Pair(PVector v) {
		a = v.get();
		b = v.get();
	}

	public Pair(PVector a_, PVector b_) {
		a = a_;
		b = b_;
	}

	public Pair(float x, float y) {
		a = new PVector(x,y);
		b = new PVector(x,y);
	}

	public Pair(float x, float y, float z) {
		a = new PVector(x,y,z);
		b = new PVector(x,y,z);
	}

}

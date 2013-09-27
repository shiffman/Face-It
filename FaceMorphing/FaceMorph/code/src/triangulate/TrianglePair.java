// This triangulation code is from: http://wiki.processing.org/w/Triangulation by Tom Carden
// Based on Paul Bourke: http://paulbourke.net/papers/triangulate/ (first Java conversion by Florian Jenett)
// Modified by Daniel Shiffman for Face Morphing example

package triangulate;

import processing.core.PVector;

public class TrianglePair {

	public Pair p1, p2, p3;

	Triangle triangleA;
	Triangle mixed;

	public TrianglePair() { 
		p1=null;
		p2=null;
		p3=null; 
	}

	public TrianglePair(Pair p1, Pair p2, Pair p3) {
		this.p1 = p1;
		this.p2 = p2;
		this.p3 = p3;
	}

	public boolean sharesVertex(TrianglePair other) {
		return p1 == other.p1 || p1 == other.p2 || p1 == other.p3 ||
		p2 == other.p1 || p2 == other.p2 || p2 == other.p3 || 
		p3 == other.p1 || p3 == other.p2 || p3 == other.p3;
	}

	public Triangle getTriangleA() {
		if (triangleA == null) triangleA = new Triangle(p1.a,p2.a,p3.a);
		return triangleA;
	}

	public Triangle mix(float amt) {
		if (mixed == null) mixed = new Triangle();
		
		mixed.p1.x = p1.a.x*(1-amt) + p1.b.x*amt;
		mixed.p1.y = p1.a.y*(1-amt) + p1.b.y*amt;

		mixed.p2.x = p2.a.x*(1-amt) + p2.b.x*amt;
		mixed.p2.y = p2.a.y*(1-amt) + p2.b.y*amt;

		mixed.p3.x = p3.a.x*(1-amt) + p3.b.x*amt;
		mixed.p3.y = p3.a.y*(1-amt) + p3.b.y*amt;

		return mixed;
	}

}

// This triangulation code is from: http://wiki.processing.org/w/Triangulation by Tom Carden
// Based on Paul Bourke: http://paulbourke.net/papers/triangulate/ (first Java conversion by Florian Jenett)
// Modified by Daniel Shiffman for Face Morphing example

package triangulate;

import processing.core.PVector;

public class Triangle {

	public PVector p1, p2, p3;

	public Triangle() { 
		p1=new PVector();
		p2=new PVector();
		p3=new PVector(); 
	}

	public Triangle(PVector p1, PVector p2, PVector p3) {
		this.p1 = p1;
		this.p2 = p2;
		this.p3 = p3;
	}

	public boolean sharesVertex(Triangle other) {
		return p1 == other.p1 || p1 == other.p2 || p1 == other.p3 ||
		p2 == other.p1 || p2 == other.p2 || p2 == other.p3 || 
		p3 == other.p1 || p3 == other.p2 || p3 == other.p3;
	}

}

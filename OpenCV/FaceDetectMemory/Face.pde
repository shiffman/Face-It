// Which Face Is Which
// Daniel Shiffman
// http://www.shiffman.net

class Face {
  
  // A Rectangle
  Rectangle r;
  
  // Am I available to be matched?
  boolean available;
  
  // Should I be deleted?
  boolean delete;
  
  // How long should I live if I have disappeared?
  int totalTime = 10;
  int timer = totalTime;
  
  // Assign a number to each face
  int id;
  
  // Make me
  Face(int x, int y, int w, int h) {
    r = new Rectangle(x,y,w,h);
    available = true;
    delete = false;
    id = faceCount;
    faceCount++;
  }

  // Show me
  void display() {
    fill(0,0,255,map(timer,0,totalTime,0,255));
    stroke(0,0,255);
    rect(r.x*scl,r.y*scl,r.width*scl, r.height*scl);
    fill(255);
    text(""+id,r.x*scl+10,r.y*scl+30);
  }

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  void update(Rectangle newR) {
    r = (Rectangle) newR.clone();
    timer = totalTime;
  }

  // Count me down, I am gone
  void countDown() {
    timer--;
  }

  // I am deed, delete me
  boolean dead() {
    if (timer < 0) return true;
    return false;
  }
}


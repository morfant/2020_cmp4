class Spring {
  
  PVector anchor;
  float len = 200;
  float k = 0.01;
  
  Spring(float l) {
    anchor = new PVector(width/2, 100);
    len = l;
  }
  
  void connect(Mover m) {
    PVector dir = PVector.sub(m.location, anchor);
    float d = dir.mag();
    float x = d - len;
    dir.normalize();    
    float strength = -1 * x * k;
    dir.mult(strength); // Fs = Fs * strength
    
    m.applyForce(dir);
  }
  
  void display() {
    fill(100);
    ellipse(anchor.x, anchor.y, 10, 10);
  }
  
  void displayLine(Mover m) {
    stroke(0);
    line(anchor.x, anchor.y, m.location.x, m.location.y);
  }
  
}

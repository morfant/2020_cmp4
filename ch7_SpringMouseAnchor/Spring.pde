class Spring {
  
  PVector anchor;
  float len;
  float k = 0.05;
  
  
  Spring(float ax, float ay, float l) {
    anchor = new PVector(ax, ay);
    len = l;
    
  }
  
  void setPos(float x, float y) {
    anchor.set(x, y);
  }
  
  void damping() {
    
  }  
  
  void connect(Mover m) {
    PVector forceDir = PVector.sub(m.location, anchor);
    float d = forceDir.mag();
    float stretch = d - len;
    forceDir.normalize();
    forceDir.mult(-1 * stretch * k);
    
    m.applyForce(forceDir);
    
  }
  
  void display() {
    noStroke();
    fill(59);
    rectMode(CENTER);
    rect(anchor.x, anchor.y, 10, 10);
  }
  
  void displayLine(Mover m) {
    stroke(130);
    float len = dist(m.location.x, m.location.y, anchor.x, anchor.y);
    float w = map(len, 1, height/2, 2.0, 0.1);
    strokeWeight(constrain(w, 2.0, 0.1));
    
    strokeWeight(0.1);
    line(m.location.x, m.location.y, anchor.x, anchor.y);
  }
}

class Mover{
  
  PVector loc, vel, acc;
  float size = 20;
  float scale = 0.2;
  Mover target = null;
  
  
  Mover() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(1.0), random(1.0));
  }
  
  
  void setTarget(Mover m) {
    target = m;
  }
  
  void update() {
  
    PVector diff = PVector.sub(target.loc, loc);
    diff.normalize();
    diff.mult(scale);
    acc = diff;
    vel.add(acc);
    loc.add(vel);
  }
  
  void checkEdge() {
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }
    
    if (loc.y > height) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = height;
    }
  }
  
  void draw() {
    noStroke();
    fill(0);
    ellipse(loc.x, loc.y, size, size);
  }

}

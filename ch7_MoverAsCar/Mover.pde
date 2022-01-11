class Mover {

  PVector loc, vel, acc;
  float mass;
  float rad;
  
  Mover(PVector loc_, float mass_) {
    loc = loc_;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = mass_;
    rad = mass * 50;
  }

  void applyForce(PVector f) {
    // F = m*a
    // F/m = a
    // a = F/m
    PVector a = PVector.div(f, mass); 
    acc.add(a);
  }

  void checkEdge() {
    if (loc.x < 0) {
      loc.x = width;
    } else if (loc.x > width) {
      loc.x = 0;
    }
    if (loc.y < 0) {
      loc.y = height;
    } else if (loc.y > height) {
      loc.y = 0;
    }
  }

  void update() {

    vel.add(acc); // (new)vel = (old)vel + acc
    loc.add(vel); // (new)loc = (old)loc + vel
    vel.limit(10);
        
    acc.mult(0);
  }
  
  
  void display() {
    
    //float angle = atan(vel.y/vel.x);
    float angle = atan2(vel.y, vel.x);
    //float angle = vel.heading2D();
    
    
    noStroke();
    fill(0);
    
    pushMatrix();
    translate(loc.x, loc.y);
    rectMode(CENTER);
    rotate(angle);
    rect(0, 0, rad, rad);
    stroke(0);
    line(0, 0, rad*2, 0);
    popMatrix();
  }
}

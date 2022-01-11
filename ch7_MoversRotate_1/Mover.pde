class Mover {

  PVector loc, vel, acc;
  float mass;
  float rad;
  
  float angle, aVel, aAcc;
  

  Mover() {
    loc = new PVector(100, 100);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = 1;
    rad = mass * 0.5;
  }

  Mover(PVector loc_, float mass_) {
    loc = loc_;
    vel = new PVector(0, 0);
    acc = new PVector(random(-5, 5), random(-5, 5));
    mass = mass_;
    rad = mass * 50;
    angle = 0;
    aVel = 0;
    aAcc = 0;
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
    
    aAcc = acc.x/2;
    aVel += aAcc;
    angle += aVel;
    
    acc.mult(0);
  }

  void display() {
    noStroke();
    fill(0);
    
    pushMatrix();
    translate(loc.x, loc.y);
    rectMode(CENTER);
    rotate(radians(angle));
    //ellipse(0, 0, rad, rad);
    rect(0, 0, rad, rad);
    popMatrix();
  }
}

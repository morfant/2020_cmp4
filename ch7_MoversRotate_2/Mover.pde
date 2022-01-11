class Mover {

  PVector loc, vel, acc;
  float mass;
  float rad;
  float angle, angleVel, angleAcc; 

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
    acc = new PVector(0, 0);
    mass = mass_;
    rad = mass * 50;
    angleAcc = 0.01;
  }

  void applyForce(PVector f) {
    // F = m*a
    // F/m = a
    // a = F/m
    PVector a = PVector.div(f, mass); 
    acc.add(a);
  }

  void checkEdge() {

    if (loc.y + rad/2 >= height) {
      loc.y = height - rad/2;
      vel.y = vel.y * -1;
    }
  }

  void update() {

    vel.add(acc); // (new)vel = (old)vel + acc
    loc.add(vel); // (new)loc = (old)loc + vel

    acc.mult(0);
    
    angleVel = angleVel + angleAcc;
    angle = angle + angleVel;
    
  }

  void display() {
    rectMode(CENTER);
    
    pushMatrix();
    
    translate(loc.x, loc.y);
    rotate(radians(angle));
    //noStroke();
    stroke(100);
    fill(0);
    rect(0, 0, rad, rad);
    
    popMatrix();
  }
  

}

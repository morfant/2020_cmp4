class Attractor {

  PVector location;
  float G = 1;
  float mass = 10;
  
  Attractor(PVector loc, float mass_) {
    location = loc;
    mass = mass_;
  }
  
  PVector attract(Mover mover) {
    PVector dist = PVector.sub(location, mover.location);
    //PVector dist = PVector.sub(mover.location, location);
    float r = dist.mag();
    r = constrain(r, 20, 30);
    PVector dir = dist.normalize();
    float strength = (G * mass * mover.mass) / (r * r); 
    PVector F = dir.mult(strength);
    return F;
  }
  
  void update() {
   
  }
  
  void display() {
    noFill();
    stroke(0);
    ellipse(location.x, location.y, mass*3, mass*3);
  }
}

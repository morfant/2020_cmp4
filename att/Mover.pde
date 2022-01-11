class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rad;
  float mass;
  
  Mover(float mass_) {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(1.0), random(1.0));
    acceleration = new PVector(0, 0);
    mass = mass_;
    rad = mass;
  }
  
  void applyForce(PVector f) {
    PVector a = PVector.div(f, mass);
    acceleration.add(a);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void checkEdge() {
    if (location.x < 0) {
      location.x = width;
    } else if (location.x > width) {
      location.x = 0;
    }
    if (location.y < 0) {
      location.y = height;
    } else if (location.y > height) {
      location.y = 0;
    }
  }
  
  void display() {
    noStroke();
    fill(0, 40);
    ellipse(location.x, location.y, rad, rad); 
  }
}

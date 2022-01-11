class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rad;
  float mass = 1;
  
  Mover(float r, float m) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    rad = r;
    mass = m;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    
    // acc reset
    acceleration.mult(0);
  }
  
  void applyForce(PVector f) {
    // A = F/M
    PVector a = PVector.div(f, mass);
    
    acceleration.add(a);
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
    //noStroke();

    noFill();
    stroke(0);
    ellipse(location.x, location.y, rad, rad); 
  }
}

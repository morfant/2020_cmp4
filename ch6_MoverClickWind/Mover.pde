class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 1;
  float rad = mass * 5;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void applyForce(PVector f) {
    acceleration.add(f);
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
    fill(0);
    ellipse(location.x, location.y, rad, rad); 
  }
}

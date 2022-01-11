class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rad;
  float topSpeed = 7;
  float mass = 3;

  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    rad = mass * 10;
  }
  
  void applyForce(PVector force) {
    // A = F/M
    PVector f = PVector.div(force, mass); // static method
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);

    acceleration.mult(0); // reset acc every frame
  }
  
  void checkEdge() {
    if (location.x < 0) {
      location.x = width;
    } else if (location.x > width) {
      location.x = 0;
    }
    if (location.y < 0) {
      location.y = height;
    } else if (location.y + rad/2 >= height) {
      velocity.y *= -1;
    }
  }
  
  void display() {
    noStroke();
    fill(0);
    ellipse(location.x, location.y, rad, rad); 
  }
}

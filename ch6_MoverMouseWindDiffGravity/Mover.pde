class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 1;
  float rad;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    rad = mass * 20;
  }

  Mover(float x, float y, float m) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
    rad = mass * 20;
  }

  void applyForce(PVector f) {
    PVector a = f.div(mass);
    acceleration.add(a);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    
    // reset acceleration
    acceleration.mult(0);
  }

  void checkEdge() {
    if (location.x - rad/2 < 0) {
      velocity.x *= -1;
    } else if (location.x + rad/2 > width) {
      velocity.x *= -1;
    }
    if (location.y - rad/2 < 0) {
      velocity.y *= -1;
    } else if (location.y + rad/2 >= height) {
      location.y = height - rad/2;
      velocity.y *= -1;
      if (location.y - rad/2 >= height) {
        location.y = 0;
      }
    }
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(location.x, location.y, rad, rad);
  }
}

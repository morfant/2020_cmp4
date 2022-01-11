class Mover {

  PVector location, velocity, acceleration;
  float mass = 1;
  float G = 0.1;
  float topSpeed = 4;

  Mover(float mass_) {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = mass_;
  }

  void update() {
    velocity.add(acceleration); // velocity = velocity + acceleration
    velocity.limit(topSpeed);
    location.add(velocity); // location = location + velocity
    acceleration.mult(0);
  }

  PVector attract(Mover mover) {
    PVector dist = PVector.sub(location, mover.location);
    //PVector dist = PVector.sub(mover.location, location);
    float r = dist.mag();
    r = constrain(r, 15, 30);
    PVector dir = dist.normalize();
    float strength = (G * mass * mover.mass) / (r * r);
    PVector F = PVector.mult(dir, strength);
    return F;
  }

  void applyForce(PVector f) {
    //a = f / m
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

    noStroke();
    fill(0);
    ellipse(location.x, location.y, mass*10, mass*10);
  }
}

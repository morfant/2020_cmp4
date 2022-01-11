class Attractor {

  float mass;
  PVector location, velocity, acceleration;
  float G;

  Attractor (float m) {
    location = new PVector(width/2 + random(-width/2, width/2), height/2 + random(-200, 200));
    velocity = new PVector(random(-0.4, 0.4), random(-0.4, 0.4));
    acceleration = new PVector(0, 0);
    mass = m;
    G = 0.01;
  }

  PVector attract(Attractor m) {
    PVector force = PVector.sub(location, m.location);

    float distance = force.mag();
    distance = constrain(distance, 15, 20);

    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
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
    if (location.x - mass/2 < 0) {
      location.x = mass/2;
      velocity.x *= -1;
    } else if (location.x + mass/2 > width) {
      location.x = width - mass/2;
      velocity.x *= -1;
    }
    if (location.y - mass/2 < 0) {
      location.y = mass/2;
      velocity.y *= -1;
    } else if (location.y + mass/2 > height) {
      location.y = height - mass/2;
      velocity.y *= -1;
    }
  }

  void display() {
    noStroke();
    //stroke(0);
    fill(0, 200);
    ellipse(location.x, location.y, mass * 2, mass * 2);
  }
}

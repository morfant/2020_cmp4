class Attractor {

  float mass;
  PVector location, velocity;
  float G;

  Attractor () {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-0.4, 0.4), random(-0.4, 0.4));
    mass = 20;
    G = 0.2;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);

    float distance = force.mag();
    distance = constrain(distance, 5, 25);

    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void update() {
    location.add(velocity);
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
    stroke(0);
    fill(175, 200);
    ellipse(location.x, location.y, mass * 2, mass * 2);
  }
}

class Repeller {

  float mass;
  PVector location, velocity, acceleration;
  float G;

  Repeller (float m, PVector l) {
    location = l.get();
    velocity = new PVector(random(-0.4, 0.4), random(-0.4, 0.4));
    acceleration = new PVector(0, 0);
    mass = m;
    G = 7;
  }

  PVector repel(Particle p) {
    PVector force = PVector.sub(location, p.location); // attract
    //PVector force = PVector.sub(m.location, location); // repel   

    float distance = force.mag();
    distance = constrain(distance, 5, 100);

    force.normalize();
    float strength = -1 * (G * mass * p.mass) / (distance * distance);
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

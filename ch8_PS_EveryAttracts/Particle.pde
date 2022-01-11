class Particle {

  PVector location, velocity, acceleration;
  float lifespan;
  float mass = 1;
  float G = 1;


  Particle() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-0.1, 0.1), 0);
    acceleration = new PVector(0, 0.0);

    lifespan = 255;
  }

  Particle(PVector l) {
    location = l.get();
    velocity = new PVector(random(-1, 1), 0);
    acceleration = new PVector(0, 0);

    lifespan = 255;
  }

  PVector attract(Particle p) {
    PVector force = PVector.sub(location, p.location); // attract
    //PVector force = PVector.sub(m.location, location); // repel   

    float distance = force.mag();
    distance = constrain(distance, 5, 100);

    force.normalize();
    float strength = 1 * (G * mass * p.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }


  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }


  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 1.0;

    edge();
  }

  void edge() {

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
    stroke(0, lifespan);
    fill(175, lifespan);
    ellipse(location.x, location.y, 8, 8);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }


  void run() {
    update();
    display();
  }
}

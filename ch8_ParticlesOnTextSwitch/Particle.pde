class Particle {

  PVector location, velocity, acceleration; 
  float mass = 1;
  float rad = mass * 5;
  float age = 0;
  float strength = 1;
  float maxVelocity = 3;
  boolean dir = true;
  boolean firstTime = true;
  boolean grow = false;


  Particle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(random(-0.9, 0.9), random(-0.9, 0.9));
    acceleration = new PVector(0, 0);
    rad = mass * 2;
  }

  void goToPlace(int idx) {
    PVector diff = PVector.sub(fontPos.get(idx), location); // get vector to the fontPos[idx]
    strength = diff.mag(); // length of vector, distance, strength
    diff.normalize(); // left direction element only
    diff.mult(strength); // direction * strength
    applyForce(diff);
  }

  void update(boolean dir) {

    if (dir == false) {
      velocity.add(acceleration);
      velocity.limit(strength/20);
      firstTime = true;
    } else {
      if (firstTime) {
        float vx = (float)generator.nextGaussian() * 0.5;
        float vy = (float)generator.nextGaussian() * 0.5;
        acceleration = new PVector(vx, vy);
        velocity.add(acceleration);
        firstTime = false;
      } else {
        velocity.add(acceleration);
        velocity.limit(maxVelocity);
      }
    }
    location.add(velocity);
    acceleration.mult(0);

    if (grow) {
      age += 1;
    }
  }

  boolean isDead() {
    if (age > 40) {
      return true;
    } else {
      return false;
    }
  }


  void applyForce(PVector f) {
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

    fill(0);
    noStroke();
    ellipse(location.x, location.y, rad, rad);
  }
}

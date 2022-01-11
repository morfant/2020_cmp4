class Particle {

  PVector bornLocation, location;
  PVector velocity;
  PVector acceleration;
  float mass = 1;
  float rad = mass * 5;
  float age = 0;
  float strength = 1;
  boolean dir = true;
  boolean firstTime = true;

  Particle(float m) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    acceleration = new PVector(0, 0);
    mass = m; 
    rad = mass * 5;
  }

  Particle(float x, float y) {
    location = new PVector(x, y);
    bornLocation = location.get();
    velocity = new PVector(random(-0.9, 0.9), random(-0.9, 0.9));
    acceleration = new PVector(0, 0);
    rad = mass * 8;
  }

  void goToBornPlace() {
    PVector diff = PVector.sub(bornLocation, location);

    strength = diff.mag();
    diff.normalize();

    diff.mult(strength);

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
        velocity.limit(3);
      }
    }
    location.add(velocity);
    acceleration.mult(0);

    //age += 1;
  }

  boolean isDead() {
    if (age > 100) {
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

    //strokeWeight(1);
    fill(0, 200);
    //noFill();
    //stroke(0);
    noStroke();
    ellipse(location.x, location.y, rad, rad);
  }

  void run(boolean b) {
    dir = b;
    if (dir == false) {
      goToBornPlace();
    } 
    update(dir);
    display();
  }
}

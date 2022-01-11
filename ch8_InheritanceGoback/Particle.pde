class Particle {

  PVector bornLocation, location, velocity, acceleration;
  float mass = 1;
  float rad = mass * 5;
  float age = 255;
  float minAge = 0;
  float strength = 1;
  boolean firstTime = true;




  Particle(float m, float x, float y) {
    location = new PVector(x, y);
    bornLocation = location.get();
    velocity = new PVector(random(-5, 5), random(-5, 5));
    acceleration = new PVector(0, 0);
    mass = m; 
    rad = mass * 5;
    minAge = random(100, 200);
  }
  void goback() {
    PVector dir = PVector.sub(bornLocation, location);
    strength = dir.mag();
    dir.normalize(); // direction
    dir.mult(strength); 

    acceleration.add(dir);
  }

  void updateBack() {
    velocity.add(acceleration); // velocity = velocity + acceleration
    velocity.limit(strength/10);
    location.add(velocity); // location = location + velocity
    acceleration.mult(0);
    firstTime = true;
  }

  void update() {

    if (firstTime) {
      velocity = new PVector(random(-5, 5), random(-5, 5));
      firstTime = false;
    }

    velocity.add(acceleration); // velocity = velocity + acceleration
    velocity.limit(5);
    location.add(velocity); // location = location + velocity
    acceleration.mult(0);

    age -= 1; // age = age + 1
  }

  boolean isDead() {
    if (age < minAge) {
      return true;
    } else {
      return false;
    }
  }


  void applyForce(PVector f) {
    PVector a = PVector.div(f, mass); // F = m*a ==> a = m / F
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
    fill(255);
    ellipse(location.x, location.y, rad, rad);
  }

  void run() {
    update();
    display();
  }

  void runBack() {
    goback();
    updateBack();
    display();
  }
}

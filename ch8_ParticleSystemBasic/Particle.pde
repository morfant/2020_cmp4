class Particle {
    
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 1;
  float rad = mass * 5;
  float age = 0;
  
  Particle(float m) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0);
    mass = m; 
    rad = mass * 5;
    
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    age += 1;
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
    
    strokeWeight(1);
    //fill(0);
    noFill();
    stroke(0);
    ellipse(location.x, location.y, rad, rad); 
  }
  
  void run() {
    update();
    display();
  }

    
}

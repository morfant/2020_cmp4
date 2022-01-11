class Particle {
  
  PVector location, velocity, acceleration;
  float lifespan;
  
  Particle() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-1, 1), random(-3, 0));
    acceleration = new PVector(0, 0.05);
    
    lifespan = 255;
  }
  
  Particle(PVector l) {
    location = l.get();
    velocity = new PVector(random(-1, 1), random(-3, 0));
    acceleration = new PVector(0, 0.05);
    
    lifespan = 255;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    lifespan -= 2.0;
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

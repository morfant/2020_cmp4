class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rad;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(random(-0.01, 0.01), random(-0.1, 0.1));
    rad = 80;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(10);
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
    noStroke();
    fill(0);
    ellipse(location.x, location.y, rad, rad); 
  }
}

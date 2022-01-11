class Mover{
  PVector location;
  PVector velocity;
  float rad;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-3, 3), random(-3, 3));
    rad = 60;
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
    noStroke();
    fill(0);
    ellipse(location.x, location.y, rad, rad); 
  }
}

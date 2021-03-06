class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed = 3;
  float rad = 5;
  int offset = 0;
  
  Mover() {
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
  
  void update() {
    PVector target = brightDots.get(offset);
    PVector dir = PVector.sub(target, location);
    dir.normalize();
    dir.mult(2);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);

    if (frameCount % 5 == 0) {
      offset += 1;
    }
    if (offset > brightDots.size()) {
      offset = 0;
    }

    rad = velocity.mag() * 2;
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
    fill(255, map(location.y, 0, height, 255, 0), map(location.x, 0, width, 255, 0), 120);
    ellipse(location.x, location.y, rad, rad); 
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rad;
  float topSpeed = 7;
  float scale = 0.5;


  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    rad = 80;
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(scale);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topSpeed);
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
    //float angle = atan(velocity.y/velocity.x);
    //float angle = atan2(velocity.y, velocity.x);
    float angle = velocity.heading2D();
    
    fill(0);
    rectMode(CENTER);

    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    noStroke();
    rect(0, 0, rad, rad);
    popMatrix();
  }
}

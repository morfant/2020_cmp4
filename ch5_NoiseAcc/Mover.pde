class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rad;
  float xoffset = 0;
  float yoffset = 100;
  float topSpeed = 3;
  float ax, ay;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    rad = 80;
  }
  
  void update() {
    ax = noise(xoffset);
    ay = noise(yoffset);
    acceleration = new PVector(ax - 0.5, ay - 0.5).div(10);
    //acceleration = new PVector(random(-1, 1), random(-1, 1)).div(10);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    xoffset += 0.005;
    yoffset += 0.005;
    
    rad = velocity.mag() * 40;
    
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
    fill(0, rad/2);
    ellipse(location.x, location.y, rad, rad); 
  }
}

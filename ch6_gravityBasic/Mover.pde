class Mover {

  PVector loc, vel, acc;
  float rad = 30;
  float mass = 1;

  Mover() {
    loc = new PVector(100, 100);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  Mover(float m) {
    loc = new PVector(random(100, 400), 100);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = m;
    rad = mass * 2;
  }


  void checkEdge() {
    if (loc.x > width) loc.x = 0;
    else if (loc.x < 0) loc.x = width;

    // ground
    if (loc.y + rad/2 >= height) {
      loc.y = height - rad/2; // keep loc.y on the bottom edge
      vel.y = vel.y * -1;
    } 
    
    
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    vel.limit(5);
    loc.add(vel);

    acc.mult(0);
  }

  void display() {
    noFill();
    strokeWeight(3);
    ellipse(loc.x, loc.y, rad, rad);
  }
}

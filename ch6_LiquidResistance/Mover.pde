class Mover {

  PVector loc, vel, acc;
  float mass;
  float rad;

  Mover() {
    loc = new PVector(width/2, 100);
    vel = new PVector(random(-2, 2), random(-2, 2));
    acc = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    mass = 1;
    rad = mass * 50;
  }

  Mover(PVector loc_) {
    loc = loc_;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = 1;
    rad = mass * 50;
  }

  void applyForce(PVector f) {
    // F = m*a
    // F/m = a
    // a = F/m
    PVector a = PVector.div(f, mass); 
    acc.add(a);
  }

  boolean isInside(Liquid l) {
    if (
        loc.x > l.x && // 1
        loc.x < (l.x + l.w) && // 2
        loc.y > l.y && // 3
        loc.y < (l.y + l.h) // 4
        ) {
          return true;
    } else {
      return false;
    }
  }

  void checkEdge() {

    if (loc.y + rad/2 >= height) {
      loc.y = height - rad/2;
      vel.y = vel.y * -1;
    }
  }

  void update() {

    vel.add(acc); // (new)vel = (old)vel + acc
    loc.add(vel); // (new)loc = (old)loc + vel
    acc.mult(0);
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(loc.x, loc.y, rad, rad);
  }
}

class Mover {

  PVector loc;
  PVector vel;
  PVector acc;
  Mover target = null;
  float size = 10;

  // constructor
  Mover() {
    loc = new PVector(random(width), random(height));    
    vel = new PVector(random(1.0), random(1.0));
    acc = new PVector(0, 0);
  }


  void setTarget(Mover mov) {
    target = mov;
  }

  void update() {

    PVector dir = PVector.sub(target.loc, loc);

    dir.normalize();
    dir.mult(0.1);
    acc = dir;
    
    // (new)vel = (old)vel + acc
    vel.add(acc); //vel = vel + acc

    // (new)loc = (old)loc + vel
    loc.add(vel); //loc = loc + vel;
  }

  void checkEdge() {
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = height;
    }
  }


  void draw() {
    fill(0);
    ellipse(loc.x, loc.y, size, size);
  }
}

// Mover (class) ==> m1 (object, instance)
// Mover m1 = new Mover();

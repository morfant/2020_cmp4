Mover m;
Liquid l;
PVector gravity;
PVector friction;
float g = 0.1;

void setup() {
  size(500, 500);

  m = new Mover();
  l = new Liquid(0, height - 200, width, 200, 0.1);
}

void draw() {
  background(255);


  if (m != null) {
    
    if (m.isInside(l) == true) {
      PVector v = m.vel.get();
      float vmag = v.mag();
      v.normalize();
      PVector drag = v.mult(-1 * l.c * vmag * vmag);
      m.applyForce(drag);
    }

    gravity = new PVector(0, m.mass * g);
    m.applyForce(gravity);
    m.update();
    m.checkEdge();
    m.display();
  }

  l.display();
}

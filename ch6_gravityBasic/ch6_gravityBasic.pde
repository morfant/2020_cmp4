Mover m, m2;
PVector wind = new PVector(-0.01, 0);
PVector gravity, gravity2;

void setup() {
  size(400, 400);
  m = new Mover(10.0);
  m2 = new Mover(20.0);
  gravity = new PVector(0, 0.01 * m.mass);
  gravity2 = new PVector(0, 0.01 * m2.mass);
  // f    =                 a   *   m
  
}

void draw() {
  background(255);
  
  //m.applyForce(wind);
  m.applyForce(gravity);
  m.update();
  m.checkEdge();
  m.display();
  
  m2.applyForce(gravity);
  m2.update();
  m2.checkEdge();
  m2.display();
}

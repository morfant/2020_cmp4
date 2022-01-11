Mover m = new Mover();  
Mover n = new Mover();

void setup() {
  size (600, 500);

  m.size = 20;
  n.size = 10;
  m.setTarget(n);
  n.setTarget(m);
}

void draw() {
  background(255);
  
  m.update();
  n.update();
  m.checkEdge();
  n.checkEdge();
  m.draw();
  n.draw();

  
}

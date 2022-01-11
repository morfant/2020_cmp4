Mover m;

void setup() {
  size(1200, 500);
  m = new Mover();
}

void draw() {
  
  fill(255, 1);
  rect(0, 0, width, height);
  
  m.update();
  m.checkEdge();
  m.display();
  
}


void mousePressed() {
  m = null;
  m = new Mover();
}

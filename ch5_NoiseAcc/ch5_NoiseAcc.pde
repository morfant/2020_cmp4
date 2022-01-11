Mover m;

void setup() {
  size(500, 500);
  m = new Mover();
}

void draw() {
  
  fill(255, 10);
  rect(0, 0, width, height);
  
  m.update();
  m.checkEdge();
  m.display();
  
}


void mousePressed() {
  m = null;
  m = new Mover();
}

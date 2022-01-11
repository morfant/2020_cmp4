Mover m;

void setup() {
  size(500, 500);
  
  m = new Mover();
 
}

void draw() {
  
  fill(255, 40);
  rect(0, 0, width, height);
  
  m.update();
  m.checkEdge();
  m.display();
  
}

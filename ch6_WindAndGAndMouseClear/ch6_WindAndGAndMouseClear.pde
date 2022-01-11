Mover m;
PVector wind = new PVector(random(-0.01, 0.01), 0);
PVector g; // acc of gravity. not gravity.


void setup() {
  size(1200, 500);
  m = new Mover();
  g = new PVector(0, 0.1*m.mass);
}

void draw() {
  
  fill(255, 30);
  rect(0, 0, width, height);
  
  m.update();
  m.applyForce(wind);
  m.applyForce(g);
  m.checkEdge();
  m.display();
  
}


void mousePressed() {
  m = null;
  m = new Mover();
}

Mover m;
Mover m_heavy;
PVector wind = new PVector(1.0, 0);

void setup() {
  size(800, 500);

  m = new Mover(width/2, height/2, 1.0);
  m_heavy = new Mover(width/2, height/2 - 200, 4.0);
}

void draw() {

  fill(255, 40);
  rect(0, 0, width, height);

  m.update();
  m.checkEdge();
  m.display();

  m_heavy.update();
  m_heavy.checkEdge();
  m_heavy.display();
}


void mousePressed() {

  m.applyForce(wind);
  m_heavy.applyForce(wind);
}

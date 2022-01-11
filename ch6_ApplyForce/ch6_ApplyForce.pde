Mover m;
PVector wind = new PVector(random(-0.05, 0.05), 0);


void setup() {
  size(1200, 500);
  m = new Mover();
}

void draw() {

  fill(255, 30);
  rect(0, 0, width, height);
  
  m.applyForce(wind);
  m.update();
  m.checkEdge();
  m.display();
}


void mousePressed() {
  m = null;
  m = new Mover();
}


void keyPressed() {

  if (keyCode == ENTER) {
    if (m != null) {
      //m = null;
      m = new Mover();
    }
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dif = PVector.sub(mouse, m.location);
    dif.normalize();
    dif.mult(100);
    m.applyForce(dif);
  }
}

Mover m1, m2;

void setup() {
  size(500, 500);
  m1 = new Mover();
  m2 = new Mover();
  m1.setTarget(m2);
  m2.setTarget(m1);
}

void draw() {
  //background(255);
  fill(255, 10);
  rect(0, 0, width, height);
  
  
  m1.update();
  m2.update();
  m1.checkEdge();
  m2.checkEdge();
  m1.draw();
  m2.draw();

}

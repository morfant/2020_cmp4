Pendulum p, p1;

void setup() {

  size(500, 500);

  p = new Pendulum(width/2, 10, 200, 5);
  
  p1 = new Pendulum(width/2, 200, 100, 5);
}

void draw() {
  background(255);
  
  p.update();
  p1.update();
  p.display();
  p1.display();
}

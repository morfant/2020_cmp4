// https://scienceworld.wolfram.com/physics/DoublePendulum.html

Pendulum p, p1;

void setup() {

  size(500, 500);

  p = new Pendulum(width/2, 10, 50, 10);
  
  p1 = new Pendulum(width/2, 200, 100, 3);
}

void draw() {
  background(255);
  
  p.update();
  PVector pLoc = PVector.add(p.origin, p.loc);
  p1.setOrigin(pLoc.x, pLoc.y);
  p1.update();
  p.display();
  p1.display();
  
}

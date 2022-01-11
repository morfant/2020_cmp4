Mover m;
PVector friction;
float N = 1;
float mew = 0.01;

void setup() {
  size(500, 500);
  m = new Mover();
}

void draw() {
  background(255);
  
  if (m != null) {
    PVector v = m.vel.get(); // make a copy of m.vel as v
    v.normalize();
    friction = v.mult(-1 * N * mew);
    m.applyForce(friction);
    
    m.update();
    m.checkEdge();
    m.display();
  }
  
}

void keyPressed() {
  if (keyCode == ENTER) {
    float power = 4;
    PVector f = PVector.random2D().mult(power);
    m.applyForce(f);
  }
}

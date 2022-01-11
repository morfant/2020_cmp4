Mover m;
PVector gravity, toMouse;
float g = 0.1;

void setup() {
  size(500, 500);
  m = new Mover(new PVector(random(100, width-100), random(100, height-100)));
}

void draw() {
  background(255);

  if (m != null) {
    gravity = new PVector(0, m.mass * g);
    m.applyForce(gravity);
    m.update();
    m.checkEdge();
    m.display();
  }

}

void keyPressed() {
  if (keyCode == ENTER) {
    float power = 7.0;
    
    m = null;
    m = new Mover(new PVector(100, height - 100));
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector diff = PVector.sub(mouse, m.loc);
    diff.normalize();
    diff.mult(power);
    m.applyForce(diff);
  }
}

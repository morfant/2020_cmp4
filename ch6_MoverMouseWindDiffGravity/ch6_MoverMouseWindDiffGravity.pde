Mover m;

PVector g_l, g_r;

void setup() {
  size(800, 500);

  m = new Mover(
    random(width/4, width/4*3), 
    random(height/4, height/4*3), 1.0);

  g_l = new PVector(0, 0.1*m.mass);
  g_r = new PVector(0, 0.3*m.mass);
}

void draw() {

  background(255);
  
  // left rect
  fill(200, 100, 60, 100);
  rect(0, 0, width/2, height);

  // right rect
  fill(100, 160, 60, 100);
  rect(width/2, 0, width/2, height);

  if (m.location.x < width/2) {
    m.applyForce(g_l);
  } else {
    m.applyForce(g_r);
  }

  PVector mouse = new PVector(mouseX, mouseY);
  PVector wind = PVector.sub(m.location, mouse);
  wind.normalize();
  wind.div(10);
  m.applyForce(wind);
  m.update();
  m.checkEdge();
  m.display();

  stroke(0);
  line(width/2, 0, width/2, height);
}

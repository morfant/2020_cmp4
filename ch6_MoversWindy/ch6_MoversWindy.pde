int movers_num = 20;
Mover[] movers = new Mover[movers_num];
PVector wind = new PVector(0, 0);
PVector windF = new PVector(0, 0);


void setup() {
  size(1600, 500);
  for (int i = 0; i < movers_num; i++) {
    PVector loc = new PVector(random(width), random(height/2));
    PVector vel = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    float m = random(1, 4);
    movers[i] = new Mover(loc, vel, m);
  }
}

void draw() {
  
  background(255);
  
  if (frameCount % 100 == 0) {
    wind = PVector.random2D();
    windF = wind.get(); // copy vector
  }
  
  // wind direction
  pushMatrix();
  translate(100, 100);
  stroke(0);
  line(0, 0, wind.x * 100, wind.y * 100);
  ellipse(wind.x * 100, wind.y * 100, 10, 10);
  popMatrix();
  
  windF.mult(1);
  for (int i = 0; i < movers_num; i++) {
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    movers[i].applyForce(gravity);
    movers[i].applyForce(windF);
    movers[i].update();
    movers[i].checkEdge();
    movers[i].display();
  }
}

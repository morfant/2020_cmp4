int movers_num = 7;
Mover[] movers = new Mover[movers_num];
String str = "COLLABO";
PImage canvas;
PVector wind = new PVector(-0.01, 0);
PVector windF = new PVector(0, 0);


void setup() {
  size(1200, 1200);
  for (int i = 0; i < movers_num; i++) {
    PVector loc = new PVector(random(width), random(height/2));
    PVector vel = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    float m = random(1, 4);
    movers[i] = new Mover(loc, vel, m);
  }
  fill(random(255), random(255), random(255));
  textAlign(CENTER);
}

void draw() {

  background(#0077b6);

  if (frameCount % 100 == 0) {
    wind = PVector.random2D();
    windF = wind.get();
  }


  windF.mult(1);
  for (int i = 0; i < movers_num; i++) {
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    movers[i].applyForce(gravity);
    movers[i].applyForce(windF);
    movers[i].update();
    movers[i].checkEdge();
    movers[i].display();
  }

  fill(random(255), random(255), random(255));
  textSize(random(50));
  text(str, mouseX, mouseY);
  
  noFill();
  ellipse(mouseX, mouseY, 50, 50);
  float R = 50/2;
  for (int i = 0; i < movers_num; i++) {
    float r = movers[i].rad/2;
    float d = dist(mouseX, mouseY, movers[i].location.x, movers[i].location.y);
    
    if (R + r >= d) {
      str = "+++++++++";
    } else {
      str = "COLLABO";
    }
  }
  
  
}

// 50/2 ==> R
// movers[i].rad/2 ==> r
// dist(mouseX, mouseY, movers[i].location.x, movers[i].location.y);
// if (R + r == d) {// change backgroud}
// if (location.x = mouseX) : X
// if (location.x == mouseX) : O

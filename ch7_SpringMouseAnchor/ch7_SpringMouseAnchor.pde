Mover m;
Spring spring;

int n = 1000;
Mover[] ms = new Mover[n];
Spring[] ss = new Spring[n];
Friction fr;

PVector gravity;
float N = 1.0;


void setup() {
  size(500, 500);

  //m = new Mover(10);
  fr = new Friction(0.1);
  for (int i = 0; i < ms.length; i++) {
    ms[i] = new Mover(random(5.0, 10.0));
    ss[i] = new Spring(width/2, 100, 200);
  }
  //spring = new Spring(width/2, 100, 200);
  gravity = new PVector(0, 1);
}

void draw() {

  
  background(255);

  
  for (int i = 0; i < ms.length; i++) {
    fr.cover(ms[i]);
    ss[i].connect(ms[i]);
    ms[i].applyForce(gravity);
    ms[i].update();
    ss[i].displayLine(ms[i]);
    ss[i].display();
    ms[i].display();
  }
}

void mousePressed() {
  for (Spring s : ss) {
  s.setPos(mouseX, mouseY);
  }
}

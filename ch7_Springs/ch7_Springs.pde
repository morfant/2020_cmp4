int n = 100;
Mover[] ms = new Mover[n];
Spring[] ss = new Spring[n];
Friction fr;

PVector gravity;
float N = 1;

void setup() {
  size(500, 500);

  for (int i = 0; i < ms.length; i++) {
    ms[i] = new Mover(random(10, 50), random(1.0, 10.0));
    ss[i] = new Spring(random(100, 120));
  }

  fr = new Friction(0.001);
  gravity = new PVector(0.0, 0.1);
}

void draw() {
  background(255);

  for (int i = 0; i < ms.length; i++) {
    ms[i].applyForce(gravity);
    ms[i].update();
    ms[i].display();

    fr.connect(ms[i]);

    ss[i].connect(ms[i]);
    ss[i].display();
    ss[i].displayLine(ms[i]);
  }
}


void mousePressed() {
  ss[0].anchor.set(mouseX, mouseY);
}

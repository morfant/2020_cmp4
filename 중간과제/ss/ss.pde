Mover m;
Bar b;
//PVector wind = new PVector(0.01, 0);
float size, d;
PVector gravity;
int BW, BH;



void setup() {
  size(800, 800);
  m = new Mover(100);
  BW = 20+(int)random(80);
  BH = 100/5;
  b = new Bar(BW, BH);
  size = 5+random(20);
  //gravity = new PVector(0, 2*m.mass); //f = am
}

void draw() {
  noStroke();
  b.bar_display(); 
  fill(255, 130);
  rect(0, 0, 800, 800); //ball's tail
  m.display_grid();
  m.force();
  m.render(size);
  m.checkEdge(BW, BH);
}


void keyPressed() {
  setup();
}

float angle = 0;

void setup() {
  size(500, 500);
}

void draw() {

  float angleR = angle + 100;
  float angleG = angle + 50;
  float angleB = angle + 0;
  float r = map(sin(angleR), -1, 1, 0, 255);
  float g = map(sin(angleG), -1, 1, 0, 255);
  float b = map(sin(angleB), -1, 1, 0, 255);

  background(r, g, b);
  
  fill(255-r, 255-g, 255-b);
  textSize(80);
  text(r, 100, 100);
  text(g, 100, 200);
  text(b, 100, 300);

  angle = angle + 0.5;
  
}

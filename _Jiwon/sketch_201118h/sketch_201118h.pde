float angle = 0;
float amp = 200;
float nangle = 0.1;

void setup() {
  size(600, 400);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  float x = amp * sin(radians(angle));
  noFill();
  stroke(0);
  ellipse(x, 0, 20, 20);

  angle += nangle;
}

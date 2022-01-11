int rad = 20;
void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  background(255);

  float p = 60;
  float amp = width/2-rad;

  noStroke();
  fill(0);
  translate(width/2, height/2);
  float x = amp*cos(TWO_PI*frameCount/p);

  ellipse(x, 0, rad, rad);
}

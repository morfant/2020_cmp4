float incr = 1;

void setup() {
  size(500, 500);
  strokeWeight(4);
  noFill();
  noLoop();
}

void draw() {
  fill(200, 100, 100);
  background(255);

  for (int i = 0; i < 5; i++) {
    float period = random(50, 100);
    float freq = 1/period;
    float theta = random(TWO_PI);
    float x = 0;
    beginShape();
    vertex(0, height);
    while (x <= width + incr) {
      float yOscillation = sin(x*freq + theta)*30;
      float yHorizontal = 200 + height/9 * i;
      vertex(x, yHorizontal + yOscillation);
      x += incr;
    }
    vertex(width, height);
    endShape();
  }
}

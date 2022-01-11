void setup() {
  size(500, 500);
  noLoop();
}

void draw() {
  background(255);

  stroke(0);
  noFill();

  float period = random(50, 100);
  float freq = 1/period;

  //1
  beginShape();
  for (float x = 0; x < width; x+=1) {
    float y = sin(freq*x + radians(0));
    y = map(y, -1, 1, 0, height);
    vertex(x, y);
  }
  endShape();

  period = random(70, 100);
  freq = 1/period;

  //2
  beginShape();
  stroke(255, 100, 100);
  for (float x = 0; x < width; x+=1) {
    float y = sin(freq*x + radians(40));
    y = map(y, -1, 1, 0, height);
    vertex(x, y);
  }
  endShape();
}

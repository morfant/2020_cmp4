float angle = 0;
float angleVel = 0.1;
float startAngle = 0;

void setup() {
  size(500, 500);
  stroke(0);
  strokeWeight(2);
  noFill();
}

void draw() {

  background(255);
  beginShape();
  for (int x = 0; x < width; x += 1) {
    float y = map(sin(startAngle + angle), -1, 1, 0, height);
    vertex(x, y);
    angle += angleVel;
  }
  endShape();
}

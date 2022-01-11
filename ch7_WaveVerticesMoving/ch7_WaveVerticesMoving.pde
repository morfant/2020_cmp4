float angle = 0;
float angleVel = 0.05;
float startAngle = 0;
float period = TWO_PI/angleVel;
float freq = 1/period;

void setup() {
  size(500, 500);
  stroke(0);
  strokeWeight(2);
  noFill();
}

void draw() {

  //angleVel = frameCount/1000.0;
  angleVel = noise(frameCount/100.0)/2;
  
  angle = 0;
  background(255);
  beginShape();
  for (int x = 0; x < width; x += 5) {
    float y = map(sin(startAngle + angle), -1, 1, 0, height);
    vertex(x, y);
    angle += angleVel;
  }
  endShape();
  
  startAngle += angleVel;
}

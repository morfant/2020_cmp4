float angle = 0;
float aVelocity = 0;
float aAcceleration = 0.001;

void setup() {
  size(600, 600);
  rectMode(CENTER);
}

void draw() {
  background(255);
  fill(175);
  stroke(0);

  translate(width/2, height/2);
  rotate(angle);
  line(-50, 0, 50, 0);
  ellipse(50, 0, 8, 8);
  ellipse(-50, 0, 8, 8);

  aVelocity = aVelocity + aAcceleration;
  angle = angle + aVelocity;
}

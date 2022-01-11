float angle = 0;
float angleVel = 1.3;
float amplitude = 1100;

void setup() {
  size(2400, 200);
  background(255);
}


void draw() {

  background(255);
  
  translate(width/2, height/2);

  float x = amplitude * sin(radians(angle));

  noFill();
  stroke(0);
  ellipse(x, 0, 100, 100);

  angle += angleVel;
}

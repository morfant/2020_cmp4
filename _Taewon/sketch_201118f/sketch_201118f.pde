float angle = 0;
float angleVel = 0.7;
float amplitude = 200;

void setup() {
  size(600, 200);
  background(255);
}

void draw() {
  noStroke();
  fill(255, 100);
  rect(0, 0, width, height);
  
  translate(width/2, height/2);

  float x = amplitude * sin(radians(angle));

  noFill();
  stroke(0);
  ellipse(x, 0, 100, 100);

  angle +=angleVel;
}

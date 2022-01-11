float r;
float period=60; 

void setup() {
  size(400, 400);
  fill(0);
  r = width/2;
}

void draw() {
  background(255);
  stroke(0);
  translate(width/2, height/2);
  ellipse(r*sin(TWO_PI*(frameCount/period)), 0, 10, 10);

  if (frameCount%60 == 0) {
    r-=2;
  }
}

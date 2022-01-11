float r = 200;
float angle = 0;

void setup() {
  size (600, 600);
}

void draw() {
  background(255);

  r = lerp(r, mouseX, 0.1);

  translate(width/2, height/2);
  rotate(angle);

  for (int j = 0; j < 180; j += 10) {
    rotate(radians(j));
    pushMatrix();
    for (int i = 0; i < 360; i += 8) {
      line(
        sin(radians(i)) * r, cos(radians(i)) * r, 
        sin(radians(-i)) * r, cos(radians(-i)) * r
        );
    }
    popMatrix();
  }
  
  noFill();
  stroke(0);
  ellipse(0, 0, 2*r, 2*r);
  
  angle += TWO_PI/720;
}

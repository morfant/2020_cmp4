int r=100;
float theta=30;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  
  background(255);
  
  stroke(0);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  
  theta = map(mouseX, 0, width, 0, 360);
  
  noStroke();
  fill(0);
  
  translate(width/2, height/2);
  ellipse(r*cos(radians(theta)), r*sin(radians(theta)), 10, 10);
}

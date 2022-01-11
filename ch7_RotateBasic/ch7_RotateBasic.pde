void setup() {
  size (300, 300);
  background(255);
  noStroke();
}

void draw() {
  
  background(255);
  rotate(radians(map(mouseX, 0, width, 0, 360)));
  fill(0);
  
  rect(100, 100, 100, 100);
  
}

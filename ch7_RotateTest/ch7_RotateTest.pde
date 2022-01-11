void setup() {
  size(400, 400);
  rectMode(CENTER);
}

void draw() {
  background(255);
  
  float angle = map(mouseX, 0, width, 0, 360);
  
  fill(0);
  text(angle, 100, 40);
  textSize(40);
  
  stroke(0);
  line(0, 100, mouseX, 100);
  
  pushMatrix();
  translate(width/2, height/2);
  fill(0);
  rotate(radians(angle));
  rect(0, 0, 100, 100);
  fill(255, 0, 0);
  noStroke();
  ellipse(-50, -50, 10, 10);
  popMatrix();
  
  
  
  
}

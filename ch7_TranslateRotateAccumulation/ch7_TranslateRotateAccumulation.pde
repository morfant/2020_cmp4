void setup() {
  size(500, 500);
  background(255);
  
  // 1st
  translate(100, 100);
  fill(0);
  ellipse(0, 0, 100, 100);
  
  // 2nd
  translate(100, 100);
  rectMode(CENTER);
  rotate(radians(45));
  rect(0, 0, 100, 100);
  
  // 3rd
  translate(100, 100);
  rotate(radians(45));
  rect(0, 0, 100, 100);
  
}

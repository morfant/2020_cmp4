
void setup() {
  size (500, 500);
  textSize(20);
}

void draw() {

  background(200);
  PVector mouse = new PVector(mouseX, mouseY);

  // visualize vector as line
  stroke(100, 200, 100);
  strokeWeight(6);
  line(mouse.x, mouse.y, 0, 0);

  fill(0);
  text("Before normalize()", width/2, height/4);
  text("x: " + mouse.x, width/2, height/4+20);
  text("y: " + mouse.y, width/2, height/4 + 40);
  //text("z: " + mouse.z, width/2, height/4 + 60);
  text("mag: " + mouse.mag(), width/2, height/4 + 80);

  mouse.normalize();

  fill(100, 25, 250);
  text("After normalize()", width/2, height/2);
  text("x: " + mouse.x, width/2, height/2 + 20);
  text("y: " + mouse.y, width/2, height/2 + 40);
  //text("z: " + mouse.z, width/2, height/2 + 60);
  text("mag: " + mouse.mag(), width/2, height/2 + 80);
  stroke(255, 10, 50);
  noFill();
  strokeWeight(2);
  rect(width/2-10, height/2 + 57, 200, 30);
  
}

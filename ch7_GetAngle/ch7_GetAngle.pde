void setup() {
  size(500, 500);
}

void draw() {
  background(255);

  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);

  stroke(0);
  line(center.x, center.y, mouse.x, mouse.y);

  PVector diff = PVector.sub(mouse, center);
  float angle = atan2(diff.x, diff.y);
  //float angle = atan(diff.x/diff.y);
  //float angle = diff.heading2D();

  fill(0);
  textSize(40);
  text(degrees(angle), width/2, 200);
}
